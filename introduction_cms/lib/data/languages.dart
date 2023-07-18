import 'package:tools/tools.dart';

const List<Json> languages = [
  {"id": "4f9d198a-7281-4180-94a5-b238e923bc42", "name": "English"},
  {"id": "b6935d3d-bf0b-43e1-86d0-83bd62586098", "name": "Italian"},
  {"id": "f7f2bc55-c7f4-4d28-a1a9-5a2a4282d197", "name": "Latin"},
  {"id": "246ea832-1b37-4473-bfbc-a0b070d69259", "name": "Mandarin"},
  {"id": "ccac624f-5b0c-4c87-88ae-6259312fb733", "name": "Hebrew"},
  {"id": "85782786-cf92-4977-9a9d-88b93b76f6ff", "name": "German"},
  {"id": "f0f6a3bf-297f-4050-8a56-83c16a606bd7", "name": "Polish"},
  {"id": "1286ed76-0699-4844-ab1b-2a600dc6d9cb", "name": "Quenya"},
  {"id": "36700f70-eb27-4250-bd85-2fdeaf0e752f", "name": "Old English"},
  {"id": "48e55a3e-e1e7-4196-87f9-950a0a90ef83", "name": "Sindarin"},
  {"id": "e464ad70-6603-48fc-8ce7-498bff7fb018", "name": "Spanish"},
  {"id": "f475e20f-f7ca-46fb-94d8-8a67446dee93", "name": "Sicilian"},
  {"id": "d16ef057-a3e4-4868-8b59-d94b1b028b37", "name": "French"},
  {"id": "8e8a3f2e-53ee-4b5c-8e28-d41bc6eca08f", "name": "Japanese"},
  {"id": "de30f61f-dba7-4b73-8014-f7c7086d76fe", "name": "Tamil"},
  {"id": "aea307f1-8cca-4c49-9028-975d21152de0", "name": "Hindi"},
  {"id": "cc470e99-348d-4084-995c-d23f83806816", "name": "Telugu"},
  {"id": "c9c2167d-6e65-4c16-ad59-9904c568d2fe", "name": "Kannada"},
  {"id": "0c7ab805-2eb8-49f0-b258-d7e700259f0d", "name": "Malayalam"},
  {"id": "4d19c25a-590d-4385-81eb-accd14933a18", "name": "Czech"},
  {"id": "0bd611c3-f510-48e7-b2bf-e50d43d0fc9b", "name": "Portuguese"},
  {"id": "6605d871-3e85-4fdd-8a96-925f55da3e96", "name": "Cantonese"},
  {"id": "a91ecc78-d164-49c3-af20-c44b85aa9d7f", "name": "Korean"},
  {"id": "41154f78-90c0-416b-8d01-d5238d870d2c", "name": "Hungarian"},
  {"id": "55fc6319-d7cf-4511-8817-3059c35621c5", "name": "Swahili"},
  {"id": "ca974237-dc34-4b50-bc6d-86e7c45864ab", "name": "Xhosa"},
  {"id": "12c3ea55-cbf0-4847-8a7c-5c05334e79f8", "name": "Zulu"},
  {"id": "c62d3536-e703-495e-9df0-a75b4fdfd865", "name": "Russian"},
  {"id": "bd96e723-950b-4f03-8a4b-7336399ec391", "name": "None"},
  {"id": "859bd6e4-12da-4dfe-ba03-815dc2be25ee", "name": "Arabic"},
  {"id": "88dc3385-96e6-4cb0-8c16-8844b1e40d7c", "name": "Belarusian"},
  {"id": "37066b3c-c19a-4e30-8865-caaef9c54faf", "name": "Vietnamese"},
  {"id": "3ef356a9-274a-4986-a6d5-6b30c99a6942", "name": "Amharic"},
  {"id": "c8016444-2d20-4a9b-a9cf-0ff35d5c8731", "name": "Esperanto"},
  {"id": "016ec517-519b-4bed-9e66-8933e748fbec", "name": "Punjabi"},
  {"id": "e9a680f0-df0e-4059-8811-a60738851eb3", "name": "Gaelic"},
  {"id": "a2556321-9e4e-4d44-8d72-5bdcdd8f1b15", "name": "Danish"},
  {"id": "148235ad-8893-498c-95dd-adef220f0e44", "name": "Yiddish"},
  {"id": "d28d7cb8-a2be-4644-9f16-9bfc148cf434", "name": "Kikuyu"},
  {"id": "3fa9eb33-c84f-4d40-86bf-687457a49b24", "name": "Tagalog"},
  {"id": "b6ed9ddd-cc58-4e1f-a5e4-0ea9f8ddaf70", "name": "Kalmyk-Oirat"},
  {"id": "031ac130-7557-4d4a-807d-87fa539b7a27", "name": "Quechua"},
  {"id": "5d44b85e-35e9-4911-8114-5a44241ed37b", "name": "Turkish"},
  {"id": "f21fc7ce-e91e-4b15-b61a-c30c0c1097db", "name": "Persian"},
  {"id": "454502a3-f577-4d7a-89c8-00862713f35b", "name": "Chinese"},
  {"id": "cd590799-1645-4005-84f3-f3828ad6986b", "name": "Greek"},
  {"id": "c359652b-9296-4622-9874-059cfdca2d78", "name": "American Sign"},
  {"id": "2ef3e68c-a010-4013-bff9-442472d17912", "name": "Norwegian"},
  {"id": "56df0809-6318-4a4c-85fa-bfb5db02a3b3", "name": "Swedish"},
  {"id": "3a683cde-5a70-4819-b946-b6e71a2e179a", "name": "Saami"},
  {"id": "8ecd7275-0e59-4988-8fba-fb2dd1c4bd84", "name": "Bengali"},
  {"id": "546cfd12-d938-483a-96ad-63322c7f2ead", "name": "Latvian"},
  {"id": "ef13f8ed-f86a-4800-9b22-e52f8af96eb1", "name": "Kurdish"},
  {"id": "0804dd1d-1b9b-44bb-8e6a-2a2cef8463a2", "name": "Hmong"},
  {"id": "2138cde9-8f5f-4fa2-9d90-ad9cb68a3170", "name": "Shanghainese"},
  {"id": "a67abfbe-b43f-4b3c-8efa-0f6c8dc64862", "name": "Irish Gaelic"},
  {"id": "d97aa2db-94b8-4930-b549-e5deb7d076a3", "name": "Japanese Sign"},
  {"id": "9f032a3f-3b62-4fd0-93d2-da8a31f9b0f6", "name": "Thai"},
  {"id": "92da1f81-6d56-4f53-914b-de07684abd56", "name": "Kinyarwanda"},
  {"id": "0663b2ab-45d3-4042-84bd-6905c7a662fd", "name": "Urdu"},
  {"id": "e02e4f8a-d475-4c3b-8871-85979c8920b9", "name": "Serbian"},
  {"id": "06c04429-4424-4482-97ca-3289c0f21ef0", "name": "Min Nan"},
  {"id": "2f6e63ce-bca1-4230-b77b-fba6310e52f4", "name": "Hokkien"},
  {"id": "a1e394aa-5391-49fd-9226-9eee83f42b72", "name": "Tatar"},
  {"id": "71a82496-c6d1-49a6-a7cf-5803243a76b2", "name": "Dutch"},
  {"id": "a379f84d-6fb4-41ff-9332-5632e278a44a", "name": "Romany"},
  {"id": "e01b7417-6e6b-4f42-a803-47bb9a99c9f7", "name": "Serbo-Croatian"},
  {"id": "eec7011d-8912-4ff3-93c1-b76ecdd8aad4", "name": "Macedonian"},
  {"id": "8d844b28-0245-4b62-a709-674d39264bf0", "name": "Slovenian"},
  {"id": "4c1a6057-ab50-4b54-8fff-edd5f7fa8ed5", "name": "Estonian"},
  {"id": "980822e1-34dd-4b76-b745-0ecb95aade65", "name": "Georgian"},
  {"id": "f001273f-9166-44bb-ba48-8d692913dba3", "name": "Finnish"},
  {"id": "64970b93-8e0d-4d79-9191-6fa157f15642", "name": "Somali"},
  {"id": "f8359996-8d2d-4df9-a992-51913009de59", "name": "Pawnee"},
  {"id": "dd0d9a90-7b77-40b4-8026-2e314d8806a3", "name": "Inuktitut"},
  {"id": "a7d09b2d-1f51-43a7-83c8-b883f8c9c0af", "name": "Sioux"},
  {"id": "bda17316-ef9a-4870-912f-472116f7b7bf", "name": "Mende"},
  {"id": "d607c264-1f5d-4387-9329-b0211b7caeaf", "name": "Afrikaans"},
  {"id": "008ebd78-d626-4dab-ba59-720ca4f8739a", "name": "Shuar"},
  {"id": "5674f38a-532a-468c-9f55-b9aed7f2cad1", "name": "Catalan"},
  {"id": "1f7d0ddd-a15f-4a49-8047-b9816042c59c", "name": "Galician"},
  {"id": "b36cb119-a726-47b2-8678-f2b2d596a941", "name": "Bosnian"},
  {"id": "964ed31a-b2ab-45ea-b535-750b23d06c24", "name": "Bulgarian"},
  {"id": "dfe6b02e-7b58-446e-91d3-bde5fe8718db", "name": "Icelandic"},
  {"id": "f6f46928-7a95-4ba0-90a5-68ed33caedc3", "name": "British Sign"},
  {"id": "f9daf513-8935-4844-9b8e-c6fe016ce6cc", "name": "Yoruba"},
  {"id": "90c72d2e-9bca-4326-9238-1612f54d11b1", "name": "Romanian"},
  {"id": "d2583bbf-e22d-466f-8aa6-603859a1a89c", "name": "Nyanja"},
  {"id": "e42e69b0-e605-4034-b862-a3614f48116b", "name": "Sotho"},
  {"id": "5d2734c6-e086-48d6-aa42-1d22fb55c631", "name": "Ukrainian"},
  {"id": "a08e5579-6c43-48f4-867b-d79fe546cd5e", "name": "Navajo"},
  {"id": "681df4e1-0430-4a59-bed1-5302325b67a8", "name": "Indonesian"},
  {"id": "c79be287-c9a8-491f-a94b-1ebcbf623263", "name": "Sign"},
  {"id": "daad0e64-da77-414a-ab0b-f114fc6c5280", "name": "Maori"},
  {"id": "cb57a609-243a-406a-bfde-51a674eef05d", "name": "Ancient (to 1453)"},
  {"id": "49b44591-ade9-4941-af2f-e6226fef50e9", "name": "Nepali"},
  {"id": "1f02014c-f03e-4c81-bb69-a1ca1579087c", "name": "Welsh"},
  {"id": "248b8f78-e615-43b4-9ac6-49a4ba8835df", "name": "Maya"},
  {"id": "a1919752-8d25-44f1-b314-5abbd183d802", "name": "Albanian"},
  {"id": "f0563874-0799-4708-baa2-06a6f3c0725d", "name": "Central Khmer"},
  {"id": "1687549d-ec1f-41d4-8649-f858b4e4876a", "name": "Corsican"},
  {"id": "1f4a4d2d-117f-428c-a69f-a5668dde0b9d", "name": "North American Indian"},
  {"id": "803d593e-e690-4218-9cd0-cd702545e135", "name": "Klingon"},
  {"id": "01ae69e3-8328-41c7-ab54-a4061bdf7372", "name": "Mohawk"},
  {"id": "2a639bb3-d4fb-45df-9f62-8da36d739c2b", "name": "Papiamento"},
  {"id": "507a6862-1cbc-4d07-be6c-4f0de427d552", "name": "Greenlandic"},
  {"id": "f03dfd8d-8b45-4333-bae3-30385ad440d2", "name": "Mixtec"},
  {"id": "8499b857-72ba-43a6-bcff-be0ae4c1c6e6", "name": "Akan"},
  {"id": "c31f550d-30bd-4f8a-9396-685b36f1a655", "name": "Flemish"},
  {"id": "f067bef5-1a48-4f44-90ae-4433d0ff5d91", "name": "Mapudungun"},
  {"id": "d0efa79d-50ef-470a-b39a-3a52ceeb4a67", "name": "Egyptian (Ancient)"},
  {"id": "f6de9a1a-5c9d-4f57-b50a-28d0995015c2", "name": "Tok Pisin"},
  {"id": "73429415-3e1a-465c-bdfa-ccedf225b98f", "name": "Assamese"},
  {"id": "150763bb-4bd2-4699-8369-e49ccf640b32", "name": "Oriya"},
  {"id": "415103d6-7289-4355-be67-ab681ebbeeb1", "name": "Marathi"},
  {"id": "16e6835f-8b21-46bb-bb58-82b26783d504", "name": "Rajasthani"},
  {"id": "4a37d9fb-79db-4365-bcf5-6cf5e358d26b", "name": "Haryanvi"},
  {"id": "e4efc75c-3a5a-4410-812c-798393e8e17d", "name": "Basque"},
  {"id": "20c559c2-b218-49c0-add9-5975aa7b546a", "name": "Slovak"}
];
