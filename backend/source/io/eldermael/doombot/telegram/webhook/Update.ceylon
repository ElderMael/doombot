shared class Update(
        shared Integer updateId,
        shared Message? message = null,
        shared Message? editedMessage = null,
        shared Message? channelPost = null,
        shared Message? editedChannelPost = null,
        shared InlineQuery? inlineQuery = null,
        shared ChosenInlineResult? chosenInlineResult = null,
        shared CallbackQuery? callbackQuery = null,
        shared ShippingQuery? shippingQuery = null,
        shared PreCheckoutQuery? precheckoutQuery = null) {}

shared class Message(
        shared Integer messageId,
        shared Integer date,
        shared Chat chat,
        shared User? from = null,
        shared User? forwardFrom = null,
        shared Chat? forward_from_chat = null,
        shared Integer? forwardFromMessageId = null,
        shared String? forwardSignature = null,
        shared Integer? forwardDate = null,
        shared Message? replyToMessage = null,
        shared Integer? editDate = null,
        shared String? authorSignature = null,
        shared String? text = null,
        shared {MessageEntity*}? entities = null,
        shared {MessageEntity*}? captionEntities = null,
        shared Audio? audio = null,
        shared Document? document = null,
        shared Game? game = null,
        shared {PhotoSize*}? photo = null,
        shared Sticker? sticker = null,
        shared Video? video = null,
        shared Voice? voice = null,
        shared VideoNote? videoNote = null,
        shared String? caption = null,
        shared Contact? contact = null,
        shared Location? location = null,
        shared Venue? venue = null,
        shared {User*}? newChatMembers = null,
        shared User? leftChatMember = null,
        shared String? newChatTitle = null,
        shared {PhotoSize*}? newChatPhoto = null,
        shared Boolean? deleteChatPhoto = null,
        shared Boolean? groupChatCreated = null,
        shared Boolean? supergroupChatCreated = null,
        shared Boolean? channelChatCreated = null,
        shared Integer? migrateToChatId = null,
        shared Integer? migrateFromChatId = null,
        shared Message? pinnedMessage = null,
        shared Invoice? invoice = null,
        shared SuccessfulPayment? successfulPayment = null) {}

shared class InlineQuery(
        shared String id,
        shared User from,
        shared String query,
        shared String offset,
        shared Location? location = null) {}

shared class ChosenInlineResult(
        shared String resultId,
        shared User from,
        shared String query,
        shared Location? location = null,
        shared String? inlineMessageId = null) {}

shared class CallbackQuery(
        shared String id,
        shared User from,
        shared String chatInstance,
        shared Message? message = null,
        shared String? inlineMessageId = null,
        shared String? data = null,
        shared String? gameShortName = null) {}

shared class ShippingQuery(
        shared String id,
        shared User from,
        shared String invoicePayload,
        shared ShippingAddress shippingAddress) {}

shared class PreCheckoutQuery(
        shared String id,
        shared User from,
        shared String currency,
        shared Integer totalAmount,
        shared String invoicePayload,
        shared String? shippingOptionId = null,
        shared OrderInfo? orderInfo = null) {}

shared class User(
        shared Integer id,
        shared Boolean isBot,
        shared String firstName,
        shared String? lastName = null,
        shared String? username = null,
        shared String? languageCode = null) {}

shared class Chat(
        shared Integer id,
        shared String type,
        shared String? title = null,
        shared String? username = null,
        shared String? firstName = null,
        shared String? lastName = null,
        shared Boolean? allMembersAreAdministrators = null,
        shared ChatPhoto? photo = null,
        shared String? description = null,
        shared String? inviteLink = null,
        shared Message? pinnedMessage = null,
        shared String? stickerSetName = null,
        shared Boolean? canSetStickerSet = null) {}

shared class MessageEntity(
        shared String type,
        shared Integer offset,
        shared Integer length,
        shared String? url = null,
        shared User? user = null) {}

shared class Audio(
        shared String fileId,
        shared Integer duration,
        shared String? performer = null,
        shared String? title = null,
        shared String? mimeType = null,
        shared Integer? fileSize = null) {}

shared class Document(
        shared String fileId,
        shared PhotoSize? thumb = null,
        shared String? fileName = null,
        shared String? mimeType = null,
        shared Integer? fileSize = null) {}

shared class Game(
        shared String title,
        shared String description,
        shared {PhotoSize*} photo,
        shared String? text = null,
        shared {MessageEntity*}? textEntities = null,
        shared Animation? animation = null) {}

shared class PhotoSize(
        shared String fileId,
        shared Integer width,
        shared Integer height,
        shared Integer? fileSize = null) {}

shared class Sticker(
        shared String fileId,
        shared Integer width,
        shared Integer height,
        shared PhotoSize thumb,
        shared String? emoji = null,
        shared String? setName = null,
        shared MaskPosition? maskPosition = null,
        shared Integer? fileSize = null) {}

shared class Video(
        shared String fileId,
        shared Integer length,
        shared Integer duration,
        shared PhotoSize thumb,
        shared Integer? fileSize = null) {}

shared class Voice(
        shared String fileId,
        shared Integer duration,
        shared String? mimeType = null,
        shared Integer? fileSize = null) {}

shared class VideoNote(
        shared String fileId,
        shared Integer length,
        shared Integer duration,
        shared PhotoSize? thumb = null,
        shared Integer? fileSize = null) {}

shared class Contact(
        shared String phoneNumber,
        shared String firstName,
        shared String? lastName = null,
        shared Integer? userId = null) {}

shared class Location(
        shared Float longitude,
        shared Float latitude) {}

shared class Venue(
        shared Location location,
        shared String title,
        shared String address,
        shared String? foursquareId = null) {}

shared class Invoice(
        shared String title,
        shared String description,
        shared String startParameter,
        shared String currency,
        shared Integer totalAmount) {}

shared class SuccessfulPayment(
        shared String currency,
        shared Integer totalAmount,
        shared String invoicePayload,
        shared OrderInfo orderInfo,
        shared String telegramPaymentChargeId,
        shared String providerPaymentChargeId,
        shared String? shippingOptionId = null) {}

shared class ShippingAddress(
        shared String countryCode,
        shared String state,
        shared String city,
        shared String streetLine1,
        shared String streetLine2,
        shared String postCode) {}

shared class OrderInfo(
        shared String? name = null,
        shared String? phoneNumber = null,
        shared String? email = null,
        shared ShippingAddress? shippingAddress = null) {}

shared class ChatPhoto(
        shared String smallFileId,
        shared String bigFileId) {}

shared class Animation(
        shared String fileId,
        shared PhotoSize? thumb = null,
        shared String? fileName = null,
        shared String? mimeType = null,
        shared Integer? fileSize = null) {}

shared class MaskPosition(
        shared String point,
        shared Float xShift,
        shared Float yShift,
        shared Float scale) {}