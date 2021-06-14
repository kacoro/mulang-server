import DataLoader from "dataloader";
import { Field } from "../../entities/Field";

  // [{postId: 5, userId: 10}]
  // [{postId: 5, userId: 10, value: 1}]
  export const createFieldLoader = () =>
    new DataLoader<number, Field[] | null>(
      async (keys) => {
       // const fields = await Field.findByIds(keys as any);
       const fields = await Field.find({where:{moduleId:keys},order:{sort:"ASC"}})
        const fieldsIdsToField: Record<string, Field[]> = {};
        // fields.forEach((field) => {
        //   fieldsIdsToField[`${field.moduleId}}`] = field;
        // });
        fieldsIdsToField[`${keys}`] = fields;
        return keys.map(
          (key) => fieldsIdsToField[`${key}`]
        );
      }
    );
  