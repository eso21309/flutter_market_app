import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_market_app/core/validator_util.dart';
import 'package:flutter_market_app/ui/pages/product_write/product_category_box.dart';
import 'package:flutter_market_app/ui/pages/product_write/product_write_picture_area.dart';

class ProductWritePage extends StatefulWidget {
  @override
  State<ProductWritePage> createState() => _ProductWritePageState();
}

class _ProductWritePageState extends State<ProductWritePage> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final contentController = TextEditingController();
  final formkey = GlobalKey<FormState>(); //<FormState> 폼에 관한걸 컨트롤하는 키라고 명시하는 것임

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    contentController.dispose();
    super.dispose();
  }

  //저장 버튼 클릭시
  void onWriteDone() {
    formkey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //스캐폴드 제스처로 감싸서 FocusScope.of로 키보드 빠져나갈 수 있도록 unfocus 하기
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formkey, //Form 씌우고 key 속성에 글로벌키 가져와야함
            child: ListView(
              //Form 쓸거니까 ListView를 Form으로 감싸야함
              padding: EdgeInsets.all(16),
              children: [
                ProductWritePictureArea(),
                SizedBox(height: 16),
                ProductCategoryBox(),
                SizedBox(height: 16),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "상품명을 넣어주세요",
                  ),
                  validator: ValidatorUtil.validatorTitle,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "가격을 넣어주세요",
                  ),
                  validator: ValidatorUtil.validatorPrice,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(
                    hintText: "상품내용을 넣어주세요",
                  ),
                  validator: ValidatorUtil.validatorContent,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onWriteDone,
                  child: Text("작성완료"),
                )
              ],
            ),
          )),
    );
  }
}
