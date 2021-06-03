import DataLoader from "dataloader";
import { Module } from "../entities/Module";

// [1, 78, 8, 9]
// [{id: 1, username: 'tim'}, {}, {}, {}]
export const createModuleLoader = () =>
  new DataLoader<number, Module>(async (moduleIds) => {
    const modules = await Module.findByIds(moduleIds as number[]);
    const moduleIdtoModule: Record<number, Module> = {};
    modules.forEach((u) => {
      moduleIdtoModule[u.id] = u;
    });

    const sortedUsers = moduleIds.map((moduleId) => moduleIdtoModule[moduleId]);
    // console.log("userIds", userIds);
    // console.log("map", userIdToUser);
    // console.log("sortedUsers", sortedUsers);
    return sortedUsers;
  });
