'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "b36d7d0c014e3f46695f09a5c84cf4de",
".git/config": "42d3e06ae9d0adc8ec21b6a9f424ad50",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "ac9279650ed4de97aa1e6dc7e592c7d7",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "cc597f5135c4cf452c96bf7dea03e9a5",
".git/logs/refs/heads/gh-pages": "2515f2a9073914f9ef4fc425233eaea1",
".git/logs/refs/remotes/origin/gh-pages": "44a7c8785227f4d7f21e629dbfab2faf",
".git/objects/02/0848adb8ef0b7ea3b5a4aaa0a89ef13f79644e": "5375108beb807ec3e3d69fef11ea5f89",
".git/objects/03/e300719f588b9a83cbae43fa135768ef7d7250": "914a8830d23e54995778c3b25298360a",
".git/objects/05/6708caca59fe396a2de2723f5e27920972b734": "cd694d98521964c5a001b09a5bc351d7",
".git/objects/07/228c9c0fe6147d7b61656757f95aa5cef487a2": "7dd9e4083099a0158d75701a4b914677",
".git/objects/07/c4705d03faadabbbe98beeff2dd85286859ff7": "f3fc3b6a067d083d64fdcf972ccca14d",
".git/objects/08/27c17254fd3959af211aaf91a82d3b9a804c2f": "360dc8df65dabbf4e7f858711c46cc09",
".git/objects/09/97810f9b2e13085f186fe2d5e709f2ecf6c3c6": "f35f025b5ecbe67a68d5f635e203fa21",
".git/objects/0a/5d5fe830bc2604bf1d8f31ec1a52a5839517f2": "2d98040ff5f2368255d87dd25a859f68",
".git/objects/0b/c0006635f940a222b573f0aff1152ebe675f73": "324e3d48651bb85c64e1bb97480e3ecb",
".git/objects/0f/1979596b903653e065b971270459ab2c5d73b0": "5e021e0b3c2ea40b428d65df6aa85ddf",
".git/objects/14/de17d6ebc3627def2dfa5e39b4de89d2a747a3": "8e16a058cbf934d4702ad5bd6bfde2a7",
".git/objects/18/81c19a24ac95af91abded02e8e470b81415cb9": "c7ac117357e623c7abd81bede2138291",
".git/objects/19/071594230aac2914b961203dcd9027ce463ef8": "2c957fab440b1d96d4d0cd21554e9412",
".git/objects/1e/adacdcbf8557ccfc8c0af722e8af9fc6b1fee4": "0b0aea2b239f4bbf3ec40b265873ebfe",
".git/objects/1e/c5cbd4c65252af16f18d39b00dfecb1d4114fd": "ca46a5e561f74d0e4696dc58faf4a384",
".git/objects/24/bb699ffe7a8889bf058fba373ed9f898a84273": "7d8046d2d7fba736ed1358926de0f788",
".git/objects/26/d43aa7052dcca6866ab334a70c6f53c0f77b4d": "899a3f47e4de67691f92162fb9f76319",
".git/objects/27/2e054ba25649715714d555c7c343b5d6655962": "fbcc273d0b72bd8b3f4fefae8b05437d",
".git/objects/28/8b551269da6f8ad8d17e02ed0fc8eb0712a0e1": "42d70c0c293ead6f0d00e40241840a85",
".git/objects/29/1cb97b23fef678eb0a7b633e1dc5b33c8afd32": "28f21b516461aab29fdd3f830ca34ca8",
".git/objects/2a/e099ed99b659e05ce63d2e0a4a6ff880eee703": "ca00a1c522968aa469e2719715b429d2",
".git/objects/2c/b525bcabae06fa00e1b613f94c5e76451234de": "4f6167a4c89fd924fa909880ac9dd589",
".git/objects/2d/8034be06faee1dd36262d57e9e0abcb6d49c94": "f7601879e1910d53ad26413f2ad52e78",
".git/objects/2d/8efa28903315c36744ced0d8678ae2e6cca400": "4ba9814a6fe980fa09e2ede30312432d",
".git/objects/2e/c138d21f54bb92472cbab94b77b6be328730be": "3ad6d7b49538415adef4fda8f2034baf",
".git/objects/34/9d5bbfb95bffd1f0043f1f03fb4b88b89b75cb": "5505c73e2722d8de059deb95af43e670",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/43/127e3daa4968d2a689e30de7a6482da2690d9d": "0382a536ea75e07a8178a665c1152fb6",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/46/9a140a69daac42fa22b2c915fa6ef2b38d7a75": "77b9c62cbd06864832d738cb471aecf6",
".git/objects/49/87dd69d8d9619041b93ac8850044742710b8dc": "01a5d5a92eff39fae92b9d4dc284682b",
".git/objects/4a/0d8649b3d7a33178c7cb5b77322b624678303c": "ec4cad7dd63d9742dc8334669e138d43",
".git/objects/4a/df212d9dfeb1f5a93163b2bcc69fc60ec2c676": "1ac1bb4ebdd8696dbde9bd7ae5e0cabb",
".git/objects/4f/2ddc6c36f66a540b543c52a80b3105e12efd45": "e375f99cca334e1cbb689ad87dc60ae2",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/52/7fdec59852c4e9386c5a5969f0982ff06e4083": "c095e640f2ff611e8eb0a3fad762700b",
".git/objects/5a/93e18e9012b926bc4ecc87483e959b2fb83b03": "29e89cb047004e58470ca90d16f38514",
".git/objects/5c/0f45cf38c5796581376b6be03b5fe9409d1903": "0be60df2d2a28ca7597cb7dad65ee970",
".git/objects/5f/2ae9dc70f24dce6292a7598cd3136b35c89547": "f0848b2d109ffedb329e21cac1d6503c",
".git/objects/61/86ae80ff721108d11d289a488d2f5378660a00": "c58909198b5016361d21411386b95fea",
".git/objects/65/f550e7d7e34f5d9df7b268838256187e2fe6d9": "83d1925e062528fd70d5727da7021214",
".git/objects/66/6e81dca263828d9eec9a0dc0c83396cf7c1a62": "4c45d1eb0d89db66185c6a4d790316a7",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6b/b40422170586fe84460c9dbd8a7e1bb2fbcdbd": "6fb3ddc8813c2a3b8d5d27fd7b79aa25",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/73/8adf2993b0a3e7b078d51c01e8ec5a56a736e4": "dbdb3449094b29c6efed4cf86f67451f",
".git/objects/79/46f6fd5cb42db03a566747fe473149fabcb60a": "6da68783b95489f41ce11c23808e2b73",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/80/e02b967b878f07ef55fcc233b01cb38bc85505": "76997c069df98a24b33582c0d5edb8f8",
".git/objects/81/0c7ef1f756a62a447ec2ffb5a6f3c34b422612": "f0805e1fee26e2ed3c0ec48ab10f0241",
".git/objects/81/1d45d9f19eadb303915ca54a5e8ac94fd8dee9": "9b741528aaeaf9630c70f69d73343726",
".git/objects/81/6e8aad6a48b409e5d2a010080ee149f699f556": "c6b3194e92a5e959d2369bcddfb4895a",
".git/objects/84/ce05e97a2100c02748f98bb31e00474f4cebab": "da9191e4ff00e3e085327aac0633e81a",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/objects/87/8dbfdb459165bd6deb483307d54a4a90ab417c": "3ea183080333f3d84895084dd9d32517",
".git/objects/88/720cbf0cc5157710aeddb8ea9cc5404ffa8de4": "1881048c2d3dee47ac5253214d3abc7e",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/21753cdb204192a414b235db41da6a8446c8b4": "1e467e19cabb5d3d38b8fe200c37479e",
".git/objects/91/5a8747b3de8bb8ae060c1e3a1e7dda84da48ea": "3455904339f635d158ce44a0c3b5f4d6",
".git/objects/92/70ce0aaf9a0056d412528d751db2277278dd46": "8e09160ef1f93ca4349c795036091e2d",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/9a/fab431758188d861f3d2adca24007de0e9f146": "55dd3334b7285dead012e03564d7a64b",
".git/objects/9e/79ce828e1b82d31d05d23b58846eed07c022a2": "1f3001f0311b88ae54dbf9cc20e2448a",
".git/objects/a3/ae475a339d20a33470338af42be2ec4170b7aa": "25616f21f398cd9e3c797e41696857bc",
".git/objects/a6/e1963958e7fd98f63e39e6ad7b8bb41f399f74": "5590bd7abfd2b9f3add9937a763389ec",
".git/objects/a7/3f4b23dde68ce5a05ce4c658ccd690c7f707ec": "ee275830276a88bac752feff80ed6470",
".git/objects/aa/faca4c821b2133eba3ae418abd33a034d7538e": "d381fb02d336ee65c8837949142573a4",
".git/objects/ab/b1c062bc02f0b57679c30b2872cd36b86fe13c": "b4b420f4298bd1262c22adca5b6f0c87",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/b2/673c58654322efefd5320e0e4aa168b4eab6f2": "2dcb7832ed7ae97be37a35d56ac40743",
".git/objects/b3/c77026d482043bfc8e601fce86e8cd698c1c35": "2743aa821f7f61fac144527fc508e499",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/0efadfd3b29e71449fe720b0d503d3a71e78fc": "1e1acdc2ff3aebde051a6ce6c0c9315c",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/3db8a1c8ed641df12659db0f956678c5ad7c09": "bb59307d87b4ebe5bb5597f01c30497c",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/b9/7676bf036eb6b13603ae97637d2ece5420db54": "b7c04fe09461356c7b866febe0031451",
".git/objects/bb/5db311017b33d25136ca1baeee8cabe3f7a0d3": "97aaa3f5bd002c385f88a98e61eb7152",
".git/objects/bc/41b7ac1a48ae9baf761360e31c2f404a501291": "02d3d4edd92cdacc13fec28be3b50215",
".git/objects/c1/27a7ce3dd6fdbc90ed4481bfea925c61dec25f": "4d7916152feab8ea6e501bfe73f2da43",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/c9/a6c54bb47d2d4e32dc0694a4ed8defde40d8ba": "b17533b8ef7ab5d4dd498a3bbf106910",
".git/objects/cb/22baeaa263fb3519ef60cf715b987dd98563f7": "7ea539638f9302517ca9f1e11c061398",
".git/objects/cc/916506b4ca6b4c1c2e3e32d0be93e2374f4eb5": "ed3f4952db9e5bef38b5ed50b0208b7a",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d6/a421c8a5387655d198335936a5e3b7cca8ffba": "7462820b4c7b2799eab2d70ea3dd0aab",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d7/e9c1ed1094a57170c2b8ee61864c16a718aab2": "e2bc09ae2f2eab02063eeb8071c01ee8",
".git/objects/d9/1d88bd593a041f76cc5cf94b1ce7e17fcc76e1": "a8f82ff7d103f005cb71b36fdb04ed28",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/dd/4b446a4944d15f2a22b055cf3df9a08089d8ac": "cad6b538a560989464b4d79b1c81ff80",
".git/objects/e0/11534f5ebc8bc027a2e22275321e381f2198f3": "cce6affd94223a554b5c58013d84776e",
".git/objects/e3/6ce1ff38bf6cced86cd8f4c59991ac90b472e3": "0f869e14794b42a75f43aa407459a80c",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f3/195a6cb60cd0401510bb6701d4c6dbba1b7116": "c04cc892e3eb438e6cac6e5d7d604bca",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/f3/bcb3193dc1a69c0195dfeb6597f19264e68341": "2c4dd286ef3911239b8554d25116765a",
".git/objects/f3/f0d89e8df451bec69b71b198da3c63b36f9066": "ece39e8abdc8afbf78531368ce315a47",
".git/objects/f4/045d3dbb33dfee32839e4feff347734063cc7d": "28893f5f98128d84d5f9eef4e30dfb6a",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/fc/1802e23d62f35e889cbe232fd01f7513461a96": "8d1af72664488b7ea07ef60277fd5293",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/refs/heads/gh-pages": "6cffc3d78ff3982a7e9bdae8dbf94c21",
".git/refs/remotes/origin/gh-pages": "6cffc3d78ff3982a7e9bdae8dbf94c21",
"assets/AssetManifest.bin": "0c0fca7f420ec3077b44764e2312d98a",
"assets/AssetManifest.bin.json": "b7ad4def3afeba3ca704a6cdcac9faf8",
"assets/assets/android_icon.png": "038ea15b40a395099451862327ebcfc1",
"assets/assets/css3.png": "b1bd0673d70ccee89e1457bd71554759",
"assets/assets/dart.png": "1a089616e2be1ac7c5188c00225772c8",
"assets/assets/desktop_icon.png": "e0e90a080a776fd1da23f5a249b5ce3c",
"assets/assets/docker.png": "722cafb6c71b44bba6292a603b2e198c",
"assets/assets/facebook.png": "fa74fe1619d75d68df1f0db7c654e39a",
"assets/assets/flutter.png": "abe34b0551ded954f6759cada7807e3e",
"assets/assets/github.png": "7aed3646cbea181a3da85620809e992c",
"assets/assets/html5.png": "9d5b22bfe74ac513d5cd33563908ae71",
"assets/assets/hugo.png": "6c341d7823570ab705c940f1dea993ef",
"assets/assets/instagram.png": "02c7721e097a6bb001d00fa61750bc81",
"assets/assets/ios_icon.png": "4b8039e8a442657c7b9b379322eb2793",
"assets/assets/javascript.png": "ab8e2beca091db2345ff66a5cc432985",
"assets/assets/linkedin.png": "e4d142586676a80b3927d899d3584148",
"assets/assets/Luska_transparency.webp": "1b04adfc2ec70dd2e6cbef3668858e9f",
"assets/assets/my_flutter_avatar.png": "a6fc0bb5fb8f7c50d06b283332eaa57c",
"assets/assets/profilowe.jpg": "0ed30d53d1ab15b621532b0501f9ddff",
"assets/assets/projects/02.png": "cf8468132005ef5442c5857705e39c40",
"assets/assets/projects/03.png": "9dd85f5710c01486dc5937733a22d9eb",
"assets/assets/projects/04.png": "8e2a233d5e7b9930407e3cccf54b6799",
"assets/assets/projects/05.png": "e2cc840dbaaf91e6acba1d9d44ae502f",
"assets/assets/projects/06.png": "11a36375edc4b5ba6956bdeed286f733",
"assets/assets/projects/1.png": "1f59be4af5fe374b4e3f5f6afdb3a24c",
"assets/assets/projects/m1_1.JPG": "e5c01df191a5194fc3c40f11486e7379",
"assets/assets/projects/m1_2.JPG": "d35f2978d8bd3e1f446a669b86dacf4b",
"assets/assets/projects/m1_3.JPG": "1f3cc941aedd34d9d578ace2d913daa7",
"assets/assets/projects/m2_1.jpg": "026e74e509d8d31359f678cf0ccc75c7",
"assets/assets/projects/m2_2.jpg": "5531301518c35e7eedabca24ead88da2",
"assets/assets/projects/m2_3.png": "1e7367a1b3fc39e266bc489ee5ddfd08",
"assets/assets/projects/m3_1.jpg": "744fa95c5229a1c1b70c1fdda1fd529a",
"assets/assets/projects/m3_2.jpg": "6cce9535453970eaf1b23e3e568b8365",
"assets/assets/projects/m3_3.jpg": "63adc3e5b896ffb464e4e06078e31499",
"assets/assets/projects/pekinczyk_01.jpg": "fd7f270a58d859998cc46046a0e54788",
"assets/assets/projects/pekinczyk_02.jpg": "b6a50ef84e0235a4046784a20d072deb",
"assets/assets/projects/pekinczyk_food_01.jpg": "4d8cc4c31f17b871038a6fb9a58af11f",
"assets/assets/projects/pekinczyk_food_02.jpg": "7e49bb4f4f4b7ce620a62dd0764216be",
"assets/assets/projects/pekinczyk_health_01.jpg": "668c1f6950440f6fbefee4c526007e99",
"assets/assets/projects/pekinczyk_health_02.jpg": "b655dd4518e993376c40dfbf4a4a318c",
"assets/assets/projects/pekinczyk_social_01.jpg": "039e04f715c3a0d076c9104656ab0cf1",
"assets/assets/projects/pekinczyk_social_02.jpg": "fca0241242eb569c377ac3b6eb4bbc84",
"assets/assets/projects/pekinczyk_training_01.jpg": "a5fd4b03e9053184fc020ab1172ce820",
"assets/assets/projects/pekinczyk_training_02.jpg": "98cbd9827d6d96a10aeeeb9861ff0a5f",
"assets/assets/projects/t1_1.JPG": "b1c114a39e3f831e2eb15e64cd7a11e8",
"assets/assets/projects/t1_2.JPG": "be3d0a539f867ceec45aded2bec3712e",
"assets/assets/projects/t1_3.JPG": "8d1eae5579babb35f4ca317e2134fb9b",
"assets/assets/projects/w01.png": "b1256ae160f9170ab36ce78ee7a4dc2d",
"assets/assets/projects/w02.png": "f3168876c62cbf02cb9ff94640383f96",
"assets/assets/projects/w03.jpeg": "81f24b685fd3f214e409fd29217c1235",
"assets/assets/python.png": "e04382338533c6bb0dcfc7a48bf86502",
"assets/assets/telegram.png": "d940cd7b5e7b66510b59785177c6414f",
"assets/assets/web_icon.png": "8867144689b70d099377ee3c4ab1baa0",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e8808647afdeae04a9f7446bd669f4cd",
"assets/NOTICES": "0714030f94323b2a8476caee6cbd751b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "bfa2abe7fbd27b2c08d3aa61f2970ef2",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "13a595b864f441e2438dca7447e7b4f4",
"/": "13a595b864f441e2438dca7447e7b4f4",
"main.dart.js": "19dfe5297a0478a4b02b1a0df4ac56de",
"manifest.json": "d8fe34f7ae4c072a77b924e01dac8a50",
"version.json": "51706d61f640748da65688e905c07564"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
