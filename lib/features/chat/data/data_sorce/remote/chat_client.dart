import 'dart:io';

import 'package:dio/dio.dart';
import 'package:general_consultation/core/consts/end_points.dart';
import 'package:general_consultation/features/chat/data/model/all_chats_model.dart';
import 'package:general_consultation/features/chat/data/model/get_chat_by_vendor_model.dart';
import 'package:general_consultation/features/chat/data/model/message_model.dart';
import 'package:retrofit/retrofit.dart';

// import '/index.dart';

part 'chat_client.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ChatClient {
  factory ChatClient(Dio dio, {String baseUrl}) = _ChatClient;

  @GET(EndPoints.chatsList)
  Future<AllChatsModel> getChat({
    @Query("page") int? page,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @POST(EndPoints.sendMessage)
  Future<MessageModel> sendMessage({
    @Part(name: "chat_id") required int chatId,
    @Part(name: "message") String? message,
    @Part(name: "file") File? file,
    @Part(name: "audio") File? audio,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @GET(EndPoints.message)
  Future<GetChatByVendorModel> getChatByVendor({
    @Path("id") required int vendorId,
    @Query("page") int? page,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });
}
