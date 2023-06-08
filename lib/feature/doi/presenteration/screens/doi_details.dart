import 'package:de_dtcite/core/utils/constants.dart';
import 'package:de_dtcite/core/widgets/app_scaffold.dart';
import 'package:de_dtcite/feature/doi/data/models/response_dio_model.dart';
import 'package:de_dtcite/feature/doi/presenteration/widgets/single_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoiDetails extends StatelessWidget {
  final DoiData args;

  const DoiDetails(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Doi (${args.attributes?.doi}) details",
          ),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleTextWidget(
              title: "Doi",
              value: "${args.attributes?.doi}",
            ),
            const SizedBox(
              height: 32.0,
            ),
            SingleTextWidget(
              title: "Publisher",
              value: "${args.attributes?.publisher}",
            ),
            const SizedBox(
              height: 32.0,
            ),
            SingleTextWidget(
              title: "Version",
              value: "${args.attributes?.metadataVersion}",
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              "Creators",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ...(args.attributes?.creators ?? []).map(
              (e) => Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "${e.givenName} ${e.familyName}",
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              "Title",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ...(args.attributes?.titles ?? []).map(
              (e) => Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.lang != null ? "${e.lang}" : "${e.title}",
                      style: TextStyle(
                        fontSize: e.lang != null ? 16.0 : 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    e.lang != null
                        ? Text(
                            "${e.title}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 32.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              "Subjects",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ...(args.attributes?.subjects ?? []).map(
              (e) => Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.lang != null ? "${e.lang}" : "${e.subject}",
                      style: TextStyle(
                        fontSize: e.lang != null ? 16.0 : 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    e.lang != null
                        ? Text(
                            "${e.subject}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 32.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ...(args.attributes?.descriptions ?? []).map(
              (e) => Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.lang != null ? "${e.lang}" : "${e.description}",
                      style: TextStyle(
                        fontSize: e.lang != null ? 16.0 : 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    e.lang != null
                        ? Text(
                            "${e.description}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              "Url document",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextButton(
              onPressed: () async {
                launchUrl(Uri.parse(args.attributes?.url ?? ""));
              },
              child: Text("Open url"),
            ),
          ],
        ),
      ),
    );
  }
}
