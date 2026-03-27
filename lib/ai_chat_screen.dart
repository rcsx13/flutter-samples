// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_flutter_samples/utils/hex_color.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final MenuController _attachmentMenuController = MenuController();
  static const double _attachmentMenuVerticalOffset = -8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          _buildAppBar(context),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (_attachmentMenuController.isOpen) {
                  _attachmentMenuController.close();
                }
              },
              child: const SizedBox.expand(),
            ),
          ),
          _buildInputBar(context),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: HexColor('#E4E4E4'),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(5.0, 5.0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Ionicons.chevron_back,
              size: 24,
              color: HexColor('#1A1A1A'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'AI Chat',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: MediaQuery.of(context).padding.bottom + 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MenuAnchor(
            controller: _attachmentMenuController,
            alignmentOffset: const Offset(0, _attachmentMenuVerticalOffset),
            style: MenuStyle(
              minimumSize: WidgetStateProperty.all(const Size(256, 0)),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: HexColor('#E4E4E4'), width: 1),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(Colors.white),
              elevation: WidgetStateProperty.all(4),
            ),
            menuChildren: [
              MenuItemButton(
                onPressed: () => _attachmentMenuController.close(),
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Attach a file',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 15),
                    ),
                    Text(
                      '10 MB limit',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 13,
                            color: Theme.of(context).disabledColor,
                          ),
                    ),
                  ],
                ),
              ),
            ],
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (_attachmentMenuController.isOpen) {
                  _attachmentMenuController.close();
                } else {
                  _attachmentMenuController.open();
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: HexColor('#1A1A1A'),
                ),
                child: const Icon(Ionicons.add, size: 22, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: HexColor('#F9F9F9'),
              ),
              child: TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontSize: 16),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type here',
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor,
            ),
            child: const Icon(Ionicons.arrow_up, size: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
