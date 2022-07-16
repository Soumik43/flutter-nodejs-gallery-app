import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../models/image.model.dart';
import '../service/apiService.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  Img? img;
  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        key: UniqueKey(),
        inAsyncCall: isApiCallProcess,
        child: Form(
          key: globalFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: t1,
                onChanged: (val) {
                  setState(() {
                    img!.imgName = val;
                  });
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'ProductName can\'t be empty.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Image name",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: t2,
                onChanged: (val) {
                  setState(() {
                    img!.imgUrl = val;
                  });
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'ProductName can\'t be empty.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Image Url",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: t3,
                onChanged: (val) {
                  setState(() {
                    img!.imgDetails = val;
                  });
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'ProductName can\'t be empty.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                  // errorText: "Error",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Image Details",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  APIService().saveImage(img).then(
                    (response) {
                      if (response) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          "Gallery app",
                          "Error occur",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                },
                child: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget productForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              "ImgName",
              "Image Name",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Image name can\'t be empty.';
                }
                return null;
              },
              (onSavedVal) => {
                img!.imgName = onSavedVal,
              },
              prefixIcon: const Icon(Icons.image),
              initialValue: img!.imgName ?? "",
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              "ImgDetails",
              "Image Details",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Image Details can\'t be empty.';
                }
                return null;
              },
              (onSavedVal) => {
                img!.imgDetails = onSavedVal,
              },
              prefixIcon: const Icon(Icons.image),
              initialValue: img!.imgDetails ?? "",
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              "ImgUrl",
              "Image Url",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Image Url can\'t be empty.';
                }
                return null;
              },
              (onSavedVal) => {
                img!.imgUrl = onSavedVal,
              },
              prefixIcon: const Icon(Icons.image),
              initialValue: img!.imgUrl ?? "",
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Center(
            child: FormHelper.submitButton(
              "Save",
              () {
                if (validateAndSave()) {
                  print(img!.toJson());

                  setState(() {
                    isApiCallProcess = true;
                  });

                  APIService().saveImage(img!).then(
                    (response) {
                      setState(() {
                        isApiCallProcess = false;
                      });

                      if (response) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          "Gallery app",
                          "Error occur",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                }
              },
              btnColor: const Color(0xff283B71),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
