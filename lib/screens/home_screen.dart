import 'package:flutter/material.dart';
import 'package:git_tracker/data/models/issueModel.dart';
import 'package:git_tracker/services/auth_service.dart';
import 'package:git_tracker/widgets/circular_material_spinner.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    authService.getIssues();
  }

  final TextEditingController _searchParam = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            'Hi ${authService.user.userName}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextFormField(
                        controller: _searchParam,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Search',
                            isDense: true,
                            contentPadding: EdgeInsets.all(15),
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Filter By Date',
                                isDense: true,
                                contentPadding: EdgeInsets.all(15),
                                prefixIcon: Icon(Icons.calendar_today)),
                          )),
                          Card(
                            child: IconButton(
                              icon: Icon(Icons.filter_alt_outlined),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: Color.fromRGBO(245, 246, 250, 1),
              child: Selector<AuthService, bool>(
                  selector: (context, authservice) =>
                      authservice.isGettingIssues,
                  builder: (context, gotIssues, _) {
                    var issues = authService.issues
                        .where((element) => (element?.body?.toLowerCase() ?? "")
                            .contains(_searchParam.text.toLowerCase()))
                        .toList();

                    return gotIssues
                        ? Center(
                            child: CircularMaterialSpinner(
                            loading: gotIssues,
                          ))
                        : issues.isEmpty
                            ? Center(
                                child: Text('No Issues Much Your Search'),
                              )
                            : RefreshIndicator(
                                child: ListView.builder(
                                  itemCount: issues.length,
                                  itemBuilder: (context, index) {
                                    return IssueCard(issue: issues[index]);
                                  },
                                ),
                                onRefresh: () {
                                  return authService.getIssues();
                                },
                              );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}

class IssueCard extends StatelessWidget {
  final IssuesModel issue;

  const IssueCard({Key key, this.issue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    DateFormat.yMMMd('en_us').format(issue.createdAt),
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 2),
                      child: Text(
                        issue.state,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(issue.body),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.description_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${issue.repository.name}",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  Spacer(),
                  Icon(
                    Icons.messenger_outline,
                    size: 20,
                  ),
                  Text('${issue.comments} comments')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
