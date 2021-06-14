import DataLoader from "dataloader";
import { Project } from "../../entities/Project";

// [1, 78, 8, 9]
// [{id: 1, username: 'tim'}, {}, {}, {}]
export const projectLoader = () =>
  new DataLoader<number, Project>(async (ids) => {
    const projects = await Project.findByIds(ids as number[]);
    const IdToProject: Record<number, Project> = {};
    projects.forEach((p) => {
        IdToProject[p.id] = p;
    });

    const sortedUsers = ids.map((id) => IdToProject[id]);
    // console.log("userIds", userIds);
    // console.log("map", userIdToUser);
    // console.log("sortedUsers", sortedUsers);
    return sortedUsers;
  });
