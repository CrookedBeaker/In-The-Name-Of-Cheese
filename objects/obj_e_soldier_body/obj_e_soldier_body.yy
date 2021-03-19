{
  "spriteId": {
    "name": "spr_e_armor_body_idle",
    "path": "sprites/spr_e_armor_body_idle/spr_e_armor_body_idle.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "obj_damage",
    "path": "objects/obj_damage/obj_damage.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":2,"eventType":3,"collisionObjectId":null,"parent":{"name":"obj_e_soldier_body","path":"objects/obj_e_soldier_body/obj_e_soldier_body.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":7,"eventType":7,"collisionObjectId":null,"parent":{"name":"obj_e_soldier_body","path":"objects/obj_e_soldier_body/obj_e_soldier_body.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":4,"collisionObjectId":{"name":"obj_shield","path":"objects/obj_shield/obj_shield.yy",},"parent":{"name":"obj_e_soldier_body","path":"objects/obj_e_soldier_body/obj_e_soldier_body.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":2,"value":"idle","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"state","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":5,"value":"noone","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"p","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [
    {"propertyId":{"name":"atk","path":"objects/obj_damage/obj_damage.yy",},"objectId":{"name":"obj_damage","path":"objects/obj_damage/obj_damage.yy",},"value":"4","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "Enemies",
    "path": "folders/Objects/Enemies.yy",
  },
  "resourceVersion": "1.0",
  "name": "obj_e_soldier_body",
  "tags": [],
  "resourceType": "GMObject",
}