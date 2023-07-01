import 'package:camp_finder/app/ui/app_routes.dart';
import 'package:camp_finder/app/ui/modules/search/controller/search_manager_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchManagerController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white),
        child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            autofocus: false,
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(fontStyle: FontStyle.italic, color: Colors.black),
            controller: controller.typeAheadController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: "Busca",
            ),
          ),
          suggestionsCallback: (pattern) async {
            if (pattern.isEmpty) {
              return [];
            }
            return await controller.getAutocompleteList(pattern);
          },
          onSuggestionSelected: (suggestion) {
            Get.toNamed(AppRoutes.DETAILS_PAGE, arguments: suggestion);
          },
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              elevation: 8.0,
              color: Theme.of(context).cardColor,
              shadowColor: Colors.black),
          itemBuilder: (context, suggestion) {
            return ListTile(
              leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.network(
                    suggestion.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, url, error) => Icon(Icons.error),
                  )),
              title: Text(suggestion.title),
              subtitle: Text(suggestion.nameCamping),
              // trailing: Visibility(
              //   visible: suggestion.saleInfo != null &&
              //       suggestion.saleInfo!.buyLink != null,
              //   child: ElevatedButton(
              //     onPressed: () => CustomValidation.validateLaunchURL(
              //         url: suggestion.saleInfo!.buyLink),
              //     child: Text(Messages.of(context).buyNow),
              //   ),
              // ),
            );
          },
          noItemsFoundBuilder: (context) => const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Nenhuma sugestão encontrada',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
