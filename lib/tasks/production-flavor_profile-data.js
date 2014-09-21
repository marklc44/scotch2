// RowID,Distillery,Body,Sweetness,smoky,Medicinal,Tobacco,Honey,Spicy,Winey,Nutty,Malty,Fruity,Floral,Postcode, Latitude, Longitude
// 01,Aberfeldy,2,2,2,0,0,2,1,2,2,2,2,2, 	PH15 2EB, 286580,749680
var flavorNums = [
[1,2,2,2,0,0,2,1,2,2,2,2,2],
[1,3,3,1,0,0,4,3,2,2,3,3,2],
[2,1,3,2,0,0,2,0,0,2,2,3,2],
[3,4,1,4,4,0,0,2,0,1,2,1,0],
[4,2,2,2,0,0,1,1,1,2,3,1,1],
[5,2,3,1,1,0,1,1,1,0,1,1,2],
[6,0,2,0,0,0,1,1,0,2,2,3,3],
[7,2,3,1,0,0,2,1,2,2,2,2,1],
[8,2,2,1,0,0,1,0,0,2,2,2,2],
[9,2,3,2,1,0,0,2,0,2,1,2,1],
[10,4,3,2,0,0,2,1,3,3,0,1,2],
[11,3,2,1,0,0,3,2,1,0,2,2,2],
[12,4,2,2,0,0,2,2,0,2,2,2,2],
[13,2,2,1,0,0,2,2,0,0,2,3,2],
[14,3,2,2,0,0,3,1,1,2,3,2,2],
[15,2,2,2,0,0,2,2,1,2,2,2,2],
[16,1,2,1,0,0,0,1,1,0,2,2,3],
[17,2,2,2,0,0,1,2,2,2,2,2,2],
[18,2,2,3,1,0,2,2,1,1,1,1,2],
[19,1,1,2,2,0,2,2,1,2,2,2,2],
[20,1,2,1,1,0,1,1,1,1,2,2,3],
[21,3,1,4,2,1,0,2,0,2,1,1,1],
[22,1,3,1,0,0,1,1,0,2,2,2,2],
[23,3,2,3,3,1,0,2,0,1,1,2,0],
[24,2,2,2,0,1,2,2,1,2,2,1,4],
[25,2,3,2,1,0,0,1,0,2,2,2,2],
[26,4,2,2,0,0,1,2,2,2,2,2,1],
[27,3,2,2,1,0,1,2,2,1,2,3,1],
[28,2,2,2,0,0,2,1,0,1,2,2,2],
[29,2,2,1,0,0,2,1,1,1,3,2,1],
[30,2,3,1,1,0,0,0,0,1,2,2,2],
[31,2,3,1,0,0,2,1,1,4,2,2,2],
[32,2,3,1,1,1,1,1,2,0,2,0,1],
[33,2,3,1,0,0,2,1,1,1,1,2,3],
[34,2,1,3,0,0,0,3,1,0,2,2,2],
[35,1,2,0,0,0,1,0,1,2,1,2,1],
[36,2,3,1,0,0,1,2,1,2,1,2,1],
[37,1,2,1,0,0,1,2,1,2,2,2,4],
[38,3,2,1,0,0,1,2,1,1,2,2,2],
[39,2,2,2,2,0,1,0,1,2,2,1,1],
[40,1,3,1,0,0,0,1,1,1,2,0,2],
[41,1,3,1,0,0,1,1,0,1,2,2,2],
[42,4,2,2,0,0,2,1,4,2,2,2,0],
[43,3,2,1,0,0,2,1,2,1,2,3,2],
[44,2,4,1,0,0,1,2,3,2,3,2,2],
[45,1,3,1,0,0,0,0,0,0,2,2,2],
[46,1,2,0,0,0,1,1,1,2,2,3,2],
[47,1,2,1,0,0,1,2,0,0,2,2,2],
[48,2,3,1,0,0,2,2,2,1,2,2,3],
[49,1,2,1,0,0,1,2,0,1,2,2,2],
[50,2,2,1,1,0,1,2,0,2,1,2,2],
[51,2,3,1,0,0,1,1,2,1,2,2,0],
[52,2,3,1,0,0,2,2,2,2,2,1,2]
];

var broadFlavors = [
  {
    name: 'Caol Ila',
    b1: 'smoky',
    b2: 'light',
    id: 22
  },
  {
    name: 'Dalwhinnie',
    b1: 'light',
    b2: null,
    id: 29
  },
  {
    name: 'Cragganmore',
    b1: 'rich',
    b2: 'smoky',
    id: 26
  },
  {
    name: 'Dufftown',
    b1: 'rich',
    b2: 'delicate',
    id: 31
  },
  {
    name: 'Glenmorangie',
    b1: 'rich',
    b2: 'delicate',
    id: 51
  },
  {
    name: 'Balvenie',
    b1: 'rich',
    b2: 'delicate',
    id: 12
  },
  {
    name: 'Glenlivet',
    b1: 'delicate',
    b2: 'rich',
    id: 49
  },
  {
    name: 'Bunnahabhain',
    b1: 'delicate',
    b2: 'rich',
    id: 21
  },
  {
    name: 'Glenkinchie',
    b1: 'delicate',
    b2: 'rich',
    id: 48
  },
  {
    name: 'Glenfiddich',
    b1: 'delicate',
    b2: 'light',
    id: 46
  },
  {
    name: 'AnCnoc',
    b1: 'light',
    b2: 'delicate',
    id: 2
  },
  {
    name: 'Glen Elgin',
    b1: 'light',
    b2: 'delicate',
    id: 34
  },
  {
    name: 'Auchentoshan',
    b1: 'light',
    b2: 'delicate',
    id: 6
  },
  {
    name: 'Cardhu',
    b1: 'light',
    b2: 'delicate',
    id: 22
  }
];

var appendedRecords = [];
var objs = [];

flavorNums.forEach(function(nums, i) {
  nums.shift()
  nums.push(i + 1)
  nums.push("Producer")

  var obj = {
    body: nums[0],
    sweetness: nums[1],
    smoky: nums[2],
    medicinal: nums[3],
    tobacco: nums[4],
    honey: nums[5],
    spicy: nums[6],
    winey: nums[7],
    nutty: nums[8],
    malty: nums[9],
    fruity: nums[10],
    floral: nums[11],
    flavored_id: nums[12],
    flavored_type: nums[13]
  }
  appendedRecords.push(obj)
});

appendedRecords.forEach(function(rec, i) {
  broadFlavors.forEach(function(flavors, i) {
    if(rec.flavored_id === flavors.id) {
      rec.broad_keyword1 = flavors.b1;
      rec.broad_keyword2 = flavors.b2;
    }
  });
});

appendedRecords.forEach(function(rec) {
  if(!rec.broad_keyword1) {
    rec.broad_keyword1 = null;
  }
  if(!rec.broad_keyword2) {
    rec.broad_keyword2 = null;
  }
})

console.log(JSON.stringify(appendedRecords[40], null, 2));
module.exports = JSON.stringify(appendedRecords, null, 2);










