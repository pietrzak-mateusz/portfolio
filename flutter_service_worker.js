'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "7e1e957cb51b4c16de6e154c09cdb7c1",
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
".git/index": "e3253b5da9ad20b1d42b382edb23d34b",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "dacf4e52d8ce4d162065fc6b06dc96cc",
".git/logs/refs/heads/gh-pages": "3c704c2dfa1202134b3bd79736814b6f",
".git/logs/refs/remotes/origin/gh-pages": "c5a3f28d884fbcc316582cb59c805006",
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
".git/objects/14/ff5850bbac869883e50dd09fa3d0e30b0fd8af": "59b5a0f48b57fe067a847d8fd238b868",
".git/objects/18/45253935cd888a7c355016d05d9192b7e9de0f": "0721e479e6418ef0916d4bf9f0e88a8f",
".git/objects/18/81c19a24ac95af91abded02e8e470b81415cb9": "c7ac117357e623c7abd81bede2138291",
".git/objects/18/b53d63fef3291e8a6e9b23778a706e583011cf": "cab66d263229902967000610c8d0bbe3",
".git/objects/19/071594230aac2914b961203dcd9027ce463ef8": "2c957fab440b1d96d4d0cd21554e9412",
".git/objects/1e/adacdcbf8557ccfc8c0af722e8af9fc6b1fee4": "0b0aea2b239f4bbf3ec40b265873ebfe",
".git/objects/1e/c5cbd4c65252af16f18d39b00dfecb1d4114fd": "ca46a5e561f74d0e4696dc58faf4a384",
".git/objects/24/bb699ffe7a8889bf058fba373ed9f898a84273": "7d8046d2d7fba736ed1358926de0f788",
".git/objects/26/d43aa7052dcca6866ab334a70c6f53c0f77b4d": "899a3f47e4de67691f92162fb9f76319",
".git/objects/27/2e054ba25649715714d555c7c343b5d6655962": "fbcc273d0b72bd8b3f4fefae8b05437d",
".git/objects/27/c68649348becac2c18c7dbc0eb29aaea0de99b": "6dca3a93929f2358347e29759bb1dfad",
".git/objects/27/c93e9cf68a25a7061a54376307db6d400c9ffb": "cc2d3f24079d279af300ecd13ec4f2e4",
".git/objects/28/8b551269da6f8ad8d17e02ed0fc8eb0712a0e1": "42d70c0c293ead6f0d00e40241840a85",
".git/objects/29/1cb97b23fef678eb0a7b633e1dc5b33c8afd32": "28f21b516461aab29fdd3f830ca34ca8",
".git/objects/2a/e099ed99b659e05ce63d2e0a4a6ff880eee703": "ca00a1c522968aa469e2719715b429d2",
".git/objects/2c/b525bcabae06fa00e1b613f94c5e76451234de": "4f6167a4c89fd924fa909880ac9dd589",
".git/objects/2d/8034be06faee1dd36262d57e9e0abcb6d49c94": "f7601879e1910d53ad26413f2ad52e78",
".git/objects/2d/815358994a592b72a8180a1ebdc290e834bf6b": "bf897f74c543b406108335b4c36a865c",
".git/objects/2d/8efa28903315c36744ced0d8678ae2e6cca400": "4ba9814a6fe980fa09e2ede30312432d",
".git/objects/2e/c138d21f54bb92472cbab94b77b6be328730be": "3ad6d7b49538415adef4fda8f2034baf",
".git/objects/31/c897fcb6be47cbcdd2860099e2570b0f019c98": "46718f13270d1862ed596653b4fc387b",
".git/objects/31/ecf44717316e08aacb9a6da1828b08ce4aafdd": "b39bb4d5b52465796bed4d5fe314e59d",
".git/objects/34/9d5bbfb95bffd1f0043f1f03fb4b88b89b75cb": "5505c73e2722d8de059deb95af43e670",
".git/objects/3a/23893bd12863ba2784196d925522a1a6c039cb": "fc7b6c11e0dd2079ef2424e49a5c4d65",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/43/127e3daa4968d2a689e30de7a6482da2690d9d": "0382a536ea75e07a8178a665c1152fb6",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/46/9a140a69daac42fa22b2c915fa6ef2b38d7a75": "77b9c62cbd06864832d738cb471aecf6",
".git/objects/49/7a36212ccb6ed829601679b97063bb24d1ea2f": "0a2902fda16f695457e0e9fd1a0e9573",
".git/objects/49/87dd69d8d9619041b93ac8850044742710b8dc": "01a5d5a92eff39fae92b9d4dc284682b",
".git/objects/4a/0d8649b3d7a33178c7cb5b77322b624678303c": "ec4cad7dd63d9742dc8334669e138d43",
".git/objects/4a/ab5005bd8f6681a28f66bfad65d5d36b008e43": "63d905bbd7911241335f8224d738d128",
".git/objects/4a/df212d9dfeb1f5a93163b2bcc69fc60ec2c676": "1ac1bb4ebdd8696dbde9bd7ae5e0cabb",
".git/objects/4b/237eddb58280da21ec52b0382462fc99881ede": "7d60f2df3f15bab6ab87da49868b2fb3",
".git/objects/4e/50d1b26409176afa6c3643a62ac0214d853262": "954a56e5489e81c333da251765e50c5e",
".git/objects/4f/2ddc6c36f66a540b543c52a80b3105e12efd45": "e375f99cca334e1cbb689ad87dc60ae2",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/51/a6ea71e9aadf40839960d0ebc4b6fbaf213096": "f72e49ce82607eef0bb3d537639c9972",
".git/objects/52/7fdec59852c4e9386c5a5969f0982ff06e4083": "c095e640f2ff611e8eb0a3fad762700b",
".git/objects/53/02aea6bbb1f4b9cc102071a1f6dd60c78c696f": "d3f311dc0253b937e9d9ab7b15e0879b",
".git/objects/5a/93e18e9012b926bc4ecc87483e959b2fb83b03": "29e89cb047004e58470ca90d16f38514",
".git/objects/5a/9537fa6f6dc6e265dd9781405ae14412aff901": "4d465c050ce1accdc078fc1ca566cf53",
".git/objects/5c/0f45cf38c5796581376b6be03b5fe9409d1903": "0be60df2d2a28ca7597cb7dad65ee970",
".git/objects/5f/2ae9dc70f24dce6292a7598cd3136b35c89547": "f0848b2d109ffedb329e21cac1d6503c",
".git/objects/60/9b63d0e3795b22918e016eace798b7e6da15ca": "41f588375702793b087f72061a708726",
".git/objects/61/86ae80ff721108d11d289a488d2f5378660a00": "c58909198b5016361d21411386b95fea",
".git/objects/65/f550e7d7e34f5d9df7b268838256187e2fe6d9": "83d1925e062528fd70d5727da7021214",
".git/objects/66/6e81dca263828d9eec9a0dc0c83396cf7c1a62": "4c45d1eb0d89db66185c6a4d790316a7",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/6b/84256c38f12b7fb90874c3ea58f098e8152403": "cb813f294d6dea9092c1ad9c8c11daeb",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6b/b40422170586fe84460c9dbd8a7e1bb2fbcdbd": "6fb3ddc8813c2a3b8d5d27fd7b79aa25",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/73/5d27fbc920ff493cd947ce69ac01c3fd7068c3": "81b45ed7958c901d296311ce05ef32e0",
".git/objects/73/8adf2993b0a3e7b078d51c01e8ec5a56a736e4": "dbdb3449094b29c6efed4cf86f67451f",
".git/objects/79/46f6fd5cb42db03a566747fe473149fabcb60a": "6da68783b95489f41ce11c23808e2b73",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/7e/501506df3c4c2231f4cecbbe6890536763d09c": "3438e9b6c1b079650b07aa69e2a7048a",
".git/objects/7e/6e04d70cdd1705055bb6371cbdd40861a6259b": "2a8a585e10739d9078ae2f791084cc5b",
".git/objects/7f/63282a9a5b6511d5b9e1047d9bd9d955b6e51a": "4244234bf7e754c544f9f89f2bbee9ab",
".git/objects/80/e02b967b878f07ef55fcc233b01cb38bc85505": "76997c069df98a24b33582c0d5edb8f8",
".git/objects/81/0c7ef1f756a62a447ec2ffb5a6f3c34b422612": "f0805e1fee26e2ed3c0ec48ab10f0241",
".git/objects/81/1d45d9f19eadb303915ca54a5e8ac94fd8dee9": "9b741528aaeaf9630c70f69d73343726",
".git/objects/81/6e8aad6a48b409e5d2a010080ee149f699f556": "c6b3194e92a5e959d2369bcddfb4895a",
".git/objects/84/ce05e97a2100c02748f98bb31e00474f4cebab": "da9191e4ff00e3e085327aac0633e81a",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/objects/85/c4afc9ab7e223c782cf5a5413871e70bfc3521": "abb4de5f557936376a2b493db25a4312",
".git/objects/86/ebfde5ab35e2bbdab86ed6a485a2df7295fd44": "0e31f1ac9357ba43773cebc02b739bc4",
".git/objects/87/8dbfdb459165bd6deb483307d54a4a90ab417c": "3ea183080333f3d84895084dd9d32517",
".git/objects/88/720cbf0cc5157710aeddb8ea9cc5404ffa8de4": "1881048c2d3dee47ac5253214d3abc7e",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/21753cdb204192a414b235db41da6a8446c8b4": "1e467e19cabb5d3d38b8fe200c37479e",
".git/objects/91/5a8747b3de8bb8ae060c1e3a1e7dda84da48ea": "3455904339f635d158ce44a0c3b5f4d6",
".git/objects/92/3cd003153c39528fa011329c971a8a0d027eef": "b75fedd4fe1dde2ae317ae3ec8eeb041",
".git/objects/92/70ce0aaf9a0056d412528d751db2277278dd46": "8e09160ef1f93ca4349c795036091e2d",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/97/830c384a0a47152c0c7bbd998ac730797c16d6": "21ba3329bba5c196a6889bacaca4a8f6",
".git/objects/9a/fab431758188d861f3d2adca24007de0e9f146": "55dd3334b7285dead012e03564d7a64b",
".git/objects/9d/25f6cb5d5b028a39fc8f12307c8e6b659799ad": "da94fd29b60b34a3efd8d4784fd2a511",
".git/objects/9e/79ce828e1b82d31d05d23b58846eed07c022a2": "1f3001f0311b88ae54dbf9cc20e2448a",
".git/objects/9e/b163b8a9baa4f50d4efd90d785cd88a15fdc10": "2a6c4690e7e9b49f90cb4858ba52b03e",
".git/objects/a3/ae475a339d20a33470338af42be2ec4170b7aa": "25616f21f398cd9e3c797e41696857bc",
".git/objects/a5/fb8069845f247ec91b003852deefc200ca3221": "cfa28754806b2fa97c1a6098de5e905d",
".git/objects/a6/e1963958e7fd98f63e39e6ad7b8bb41f399f74": "5590bd7abfd2b9f3add9937a763389ec",
".git/objects/a7/3f4b23dde68ce5a05ce4c658ccd690c7f707ec": "ee275830276a88bac752feff80ed6470",
".git/objects/a8/1fd6a30d3604d00ae22e2f27abacd8c2c60e2e": "df7c111482a8e6f74c421a7d1e5e6dd1",
".git/objects/aa/f155ab49ef46671812fbf50bcd3c0e41164d00": "cc3d526e333aed1fab7384ed5b204f80",
".git/objects/aa/faca4c821b2133eba3ae418abd33a034d7538e": "d381fb02d336ee65c8837949142573a4",
".git/objects/ab/2d94cfbb3f1cae9e86c5f5ccbac3b3462f8ca7": "1b748a7ae654f71445cbe620572e94f8",
".git/objects/ab/b1c062bc02f0b57679c30b2872cd36b86fe13c": "b4b420f4298bd1262c22adca5b6f0c87",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/b2/673c58654322efefd5320e0e4aa168b4eab6f2": "2dcb7832ed7ae97be37a35d56ac40743",
".git/objects/b2/7d61fa77ebdab89f3c2df58bc010e4558c0960": "400dfaa419132bfd24660e35906d9860",
".git/objects/b3/c77026d482043bfc8e601fce86e8cd698c1c35": "2743aa821f7f61fac144527fc508e499",
".git/objects/b5/0afe9262fda2fa85454fd11982384f845fe5eb": "bd2c43e2b1d409b0ae05abe93b3a744f",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/0efadfd3b29e71449fe720b0d503d3a71e78fc": "1e1acdc2ff3aebde051a6ce6c0c9315c",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/3db8a1c8ed641df12659db0f956678c5ad7c09": "bb59307d87b4ebe5bb5597f01c30497c",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/b9/535344d638ff2933c900af47bfcdc631d61c08": "34d02c20a4248b8af821dd17db4ae147",
".git/objects/b9/7676bf036eb6b13603ae97637d2ece5420db54": "b7c04fe09461356c7b866febe0031451",
".git/objects/bb/5db311017b33d25136ca1baeee8cabe3f7a0d3": "97aaa3f5bd002c385f88a98e61eb7152",
".git/objects/bc/41b7ac1a48ae9baf761360e31c2f404a501291": "02d3d4edd92cdacc13fec28be3b50215",
".git/objects/bf/a1b74e8f5579267b6afe67bd5804fe1c7681c9": "44aa7bbbe682b0f5ae3b5db27fdf28d5",
".git/objects/c1/27a7ce3dd6fdbc90ed4481bfea925c61dec25f": "4d7916152feab8ea6e501bfe73f2da43",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/c9/a6c54bb47d2d4e32dc0694a4ed8defde40d8ba": "b17533b8ef7ab5d4dd498a3bbf106910",
".git/objects/cb/06e55686bf96d3539896977778112a7eaa4a97": "761a50957949209364c540d0fbad7404",
".git/objects/cb/22baeaa263fb3519ef60cf715b987dd98563f7": "7ea539638f9302517ca9f1e11c061398",
".git/objects/cc/916506b4ca6b4c1c2e3e32d0be93e2374f4eb5": "ed3f4952db9e5bef38b5ed50b0208b7a",
".git/objects/cf/3fd850e59b3cb4cdf6d398823ff5023cd112c3": "23601ed5f481b18525bb64cc2ddc7945",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d6/a421c8a5387655d198335936a5e3b7cca8ffba": "7462820b4c7b2799eab2d70ea3dd0aab",
".git/objects/d7/394812da0792d9b6bacf803153c6f409ecaba3": "869a1711803951e8780b6e82d67549b7",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d7/e9c1ed1094a57170c2b8ee61864c16a718aab2": "e2bc09ae2f2eab02063eeb8071c01ee8",
".git/objects/d9/1d88bd593a041f76cc5cf94b1ce7e17fcc76e1": "a8f82ff7d103f005cb71b36fdb04ed28",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/dd/4b446a4944d15f2a22b055cf3df9a08089d8ac": "cad6b538a560989464b4d79b1c81ff80",
".git/objects/de/807df60a9c7f99c1a1703f20750689c95345e6": "9d9847b0753a88009a3e916470d9f836",
".git/objects/de/a8825291e5ff17ce7f28cad00eb763cf5e7259": "7ffb84e03428c0e73ca4b5dc12deb642",
".git/objects/e0/11534f5ebc8bc027a2e22275321e381f2198f3": "cce6affd94223a554b5c58013d84776e",
".git/objects/e1/87f230ad45311c08a60ff87da07db03b4d5256": "64365927f26647fb221a80b6f16d9477",
".git/objects/e3/6ce1ff38bf6cced86cd8f4c59991ac90b472e3": "0f869e14794b42a75f43aa407459a80c",
".git/objects/e5/a71d765ceac0691e5163ef1eb3dbfcc7ebd221": "ac9f334502f435104780323a1c834a8b",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/28b936cb9b41fff7165f85491e6b3191f16d1a": "f3810a20680c3344cb967a5aaaf5d65d",
".git/objects/ee/25864f8278a75eb4567410beed357806b2a82c": "32c5f0e74caf4d7c3ca716076a7cefff",
".git/objects/f3/195a6cb60cd0401510bb6701d4c6dbba1b7116": "c04cc892e3eb438e6cac6e5d7d604bca",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/f3/bcb3193dc1a69c0195dfeb6597f19264e68341": "2c4dd286ef3911239b8554d25116765a",
".git/objects/f3/f0d89e8df451bec69b71b198da3c63b36f9066": "ece39e8abdc8afbf78531368ce315a47",
".git/objects/f4/045d3dbb33dfee32839e4feff347734063cc7d": "28893f5f98128d84d5f9eef4e30dfb6a",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f6/ba3f08e75b70d7745dbb5fc0253b41e8832208": "382ebdb0f4798eae06738f012eb5f482",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/f7/6dab062c778b3ef0136b539f75a31f97dc3252": "5b8c255d99c248a320331ce6047bb262",
".git/objects/f7/865759373069c628c932c54ac22489fea27ae1": "2e2cbfe7dc79ec7c9df50854c35e43bf",
".git/objects/fc/1802e23d62f35e889cbe232fd01f7513461a96": "8d1af72664488b7ea07ef60277fd5293",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/refs/heads/gh-pages": "76c8504c0c05db486fb9aaf26cca9617",
".git/refs/remotes/origin/gh-pages": "76c8504c0c05db486fb9aaf26cca9617",
"assets/AssetManifest.bin": "b8207d6088be17d5f7782724f2545f7a",
"assets/AssetManifest.bin.json": "f075eb86dd170338057ff0fe526eb4e1",
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
"assets/assets/profilowe.webp": "7ace58b3c8eb03cc4c905bfc13c82613",
"assets/assets/projects/m1_1.JPG": "17e119554c0a1d951115fcb746aed255",
"assets/assets/projects/m1_2.JPG": "4d880c14cb1033184e53234e49bd729f",
"assets/assets/projects/m1_3.JPG": "73d8571adbb0ebe8f622c711cf5f1c68",
"assets/assets/projects/m2_1.jpg": "3c8a1214ba71cd47f9ab27866a6b952e",
"assets/assets/projects/m2_2.jpg": "7c0724ae2999e99e3c0d8730dd3edc4a",
"assets/assets/projects/m2_3.jpg": "d827b8f27cc5a6878c307ad76c5e6afa",
"assets/assets/projects/m3_1.jpg": "f9842db337d2b7e158da97a8e43a4518",
"assets/assets/projects/m3_2.jpg": "68dd57fce5435f4bda0d11924c036e5a",
"assets/assets/projects/m3_3.jpg": "48ab0c73fbb42a9a879a5b8b40464036",
"assets/assets/projects/t1_1.JPG": "5022ef54774e5ca44b23e26176a8c933",
"assets/assets/projects/t1_2.JPG": "71a4ce8b69b60d5931bd7a5307b6fcdd",
"assets/assets/projects/t1_3.JPG": "bffc43f34dc444c59e07d8efe6dd1db0",
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
"flutter_bootstrap.js": "47fa1783d791137bcee2ae0f593936b8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "13a595b864f441e2438dca7447e7b4f4",
"/": "13a595b864f441e2438dca7447e7b4f4",
"main.dart.js": "c803d1a744c474d032c2ceb764cb76ea",
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
