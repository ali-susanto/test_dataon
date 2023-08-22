import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dataon/view_models/university_view_model.dart';
import 'package:test_dataon/widgets/custom_bottom_navbar.dart';

class UniversityScreen extends StatefulWidget {
  const UniversityScreen({super.key});

  @override
  State<UniversityScreen> createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UniversityViewModel>(context, listen: false).getUniversity();
    });
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<UniversityViewModel>(context);

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<UniversityViewModel>(context, listen: false)
              .getUniversity();
        },
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<UniversityViewModel>(
                builder: (context, value, child) {
                  if (value.loading) {
                    return const CircularProgressIndicator();
                  }
                  if (value.universities.isEmpty) {
                    return const Center(child: Text('Gagal memuat Data'));
                  }
                  return ListView.builder(
                      itemCount: viewModel.universities.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black87)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                viewModel.universities[index].name ?? '',
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                viewModel.universities[index].country ?? '',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        );
                      });
                },
              )),
        ),
      ),
    );
  }
}
