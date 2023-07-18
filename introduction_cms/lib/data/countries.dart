import 'package:tools/tools.dart';

const List<Json> countries = [
  {"id": "4617d807-b8e0-45b5-98ae-9bf2555bc56b", "name": "United States"},
  {"id": "5406aab8-ed31-421f-bf0b-455cd5bfdd85", "name": "United Kingdom"},
  {"id": "96e55c5d-02d5-40e2-af6c-488dcdea157a", "name": "New Zealand"},
  {"id": "4ac03fa8-770c-4807-b38a-40d8443a5005", "name": "Germany"},
  {"id": "6418bad2-59b8-403e-8404-1b61defcab30", "name": "Italy"},
  {"id": "c84fbb23-ea3e-4304-8f97-184ee3b9a790", "name": "Spain"},
  {"id": "c9028fe9-6d56-4ecf-8854-99b05539717c", "name": "West Germany"},
  {"id": "8363769a-9854-4b24-a515-4fb90f9c456d", "name": "India"},
  {"id": "0bb264d4-55c9-4ca7-850e-fb70a277568c", "name": "Canada"},
  {"id": "e0da47bd-bcd7-4470-af49-bf45b193d41b", "name": "Australia"},
  {"id": "54fa6aec-4bb7-4602-8752-a4ac6aa53430", "name": "Japan"},
  {"id": "9e8cdd1f-e873-4c38-8b8a-0fe24ec7a4ab", "name": "Brazil"},
  {"id": "951f06e7-d204-4277-a947-2c6322a7abde", "name": "France"},
  {"id": "421a7390-3877-4a45-82b3-3a38bf31030d", "name": "Hong Kong"},
  {"id": "3c57bd9b-a572-4b1a-b3ef-78b13d29ad03", "name": "Malta"},
  {"id": "eb5a3cc3-de04-4c69-9c40-a70d0c2d4b2f", "name": "Morocco"},
  {"id": "ed65a799-780f-45d5-a224-932978c802c6", "name": "South Korea"},
  {"id": "2cf414e9-0006-4818-897d-e763cddc8ea5", "name": "Poland"},
  {"id": "e71969e5-8bf5-4a5a-839f-e66a3c8959d0", "name": "Soviet Union"},
  {"id": "b7b4f58d-233e-4b6d-8513-f6ff3dfeaeb5", "name": "Lebanon"},
  {"id": "a773fc59-4a36-46ac-be9e-1604ed50aacb", "name": "Cyprus"},
  {"id": "b3cb1e50-a5e7-469c-8da7-25a6c47886e6", "name": "Qatar"},
  {"id": "172513f5-f018-4568-b1c0-885d5736ec8e", "name": "Denmark"},
  {"id": "81de2aa1-2cb0-4747-b564-533472a58c7b", "name": "Sweden"},
  {"id": "7a5d8ab1-d579-4d9d-bd21-8947d540adbc", "name": "Iran"},
  {"id": "711dbbb3-3ee8-43f7-9611-3aca52945758", "name": "Turkey"},
  {"id": "b1b24532-cd8e-4a19-8467-f898106d8ae6", "name": "China"},
  {"id": "78e43b34-8444-460b-b497-e52d0212b536", "name": "Mexico"},
  {"id": "8b7e074f-6fce-4c9c-91c7-3a828cca8be1", "name": "Austria"},
  {"id": "452d6332-e6d0-48f8-b940-3c43407c8283", "name": "Argentina"},
  {"id": "d572fe77-8190-4ae0-bcd0-ebb5a2fbdea3", "name": "Algeria"},
  {"id": "f9e1df44-c13d-4335-8302-a0ae68df566e", "name": "Ireland"},
  {"id": "713b425f-ba6a-423c-801b-3d023b9e7707", "name": "South Africa"},
  {"id": "9d6e4746-a355-47fd-abf1-9514e4a9d4b6", "name": "Switzerland"},
  {"id": "66502901-56ca-45a2-9f56-6984d6b4cdf0", "name": "Federal Republic of Yugoslavia"},
  {"id": "9708803a-6582-4362-9272-9dad14608fd9", "name": "Bulgaria"},
  {"id": "8fddd75c-53e8-4731-8a90-f8f7992fa67e", "name": "Czech Republic"},
  {"id": "154f35c0-582a-4a33-a83c-2b1d64eb8fc0", "name": "Hungary"},
  {"id": "baab6136-ea02-456f-86e8-b5cda7556f64", "name": "Libya"},
  {"id": "b8df18a9-0c0b-4e6a-a140-69d10164e77b", "name": "Kuwait"},
  {"id": "efc0ade8-3675-4752-b809-975695d41b69", "name": "Egypt"},
  {"id": "ab10cadb-99e6-44f6-897b-255ee0694898", "name": "Taiwan"},
  {"id": "069e71c4-1b4d-4bc5-a1c6-197083153af4", "name": "Yugoslavia"},
  {"id": "1e32088d-8052-4925-9dff-c66b5aa58bfd", "name": "Estonia"},
  {"id": "8734b7b0-30fb-4eb6-9b41-9124c95c681c", "name": "Georgia"},
  {"id": "590e69da-93b2-4d4a-98d5-0f11a7f45549", "name": "Jordan"},
  {"id": "99fb51cc-6bda-44d1-90a2-b9735c84b7b0", "name": "Bahamas"},
  {"id": "8093e84e-9592-43bc-9dcf-c34003c57e3c", "name": "Netherlands"},
  {"id": "13d9b2e1-33ba-48de-94d2-e3aa9e0d4fb7", "name": "Finland"},
  {"id": "ad786717-f551-4214-82dd-1545b6160a4e", "name": "Norway"},
  {"id": "28d7f806-9bc8-486e-9ad6-10f6d408694a", "name": "Luxembourg"},
  {"id": "ff49e9f1-93b5-4f72-8dee-d5a0c89caae2", "name": "Peru"},
  {"id": "e9582789-832e-4ae2-8f29-6fc31572f184", "name": "Belgium"},
  {"id": "0961bd2e-bf9a-4e8b-a49c-ca83c5afc230", "name": "UK"},
  {"id": "01c3b1b0-ffef-4b4f-a488-19f585d753eb", "name": "Bosnia and Herzegovina"},
  {"id": "ea020c7d-b28f-485d-b1c8-7735105c696a", "name": "Romania"},
  {"id": "2f20e7bf-ed3f-48b4-8a3e-2e2ed436ce9d", "name": "Greece"},
  {"id": "b30bb581-db4e-489d-8463-3bbf0f46c5d4", "name": "North Macedonia"},
  {"id": "eb386c6b-91b9-48c4-b9fc-5498a75847fe", "name": "Iceland"},
  {"id": "3dccd38c-ac4b-4a50-89f2-e1f40b49ca8c", "name": "Indonesia"},
  {"id": "9ab2b97a-6eee-43fe-bdde-f415a5a886b3", "name": "United Arab Emirates"},
  {"id": "9610de3f-55d9-48b6-9d36-f1de8436050b", "name": "Slovenia"},
  {"id": "74dc1459-3943-48cf-8571-98b2d49be096", "name": "Russia"},
  {"id": "b13a68d2-42c0-4acc-a1f5-e0bb847b228f", "name": "Czechoslovakia"},
  {"id": "0ea261f9-dbf9-4876-8b64-b42afe395121", "name": "Latvia"},
  {"id": "02b6b0f9-ea90-409a-ae47-e6a3fb100c3d", "name": "Chile"},
  {"id": "a279e4e6-a759-4da2-9211-c9b11d489c94", "name": "Thailand"},
  {"id": "7791f9c4-d7a9-4f3c-a2df-f8db7fbc71a0", "name": "USA"}
];
