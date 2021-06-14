import { createUserLoader } from "./dataLoader/createUserLoader";
import { createUpdootLoader } from "./dataLoader/createUpdootLoader";
import { createFieldLoader } from "./dataLoader/createFieldLoader";
import { createModuleLoader } from "./dataLoader/createModuleLoader";
import { projectLoader } from "./dataLoader/projectLoader";
const entitieLoaders = {
    UpdootLoader:createUpdootLoader(),
    UserLoader:createUserLoader(),
    ModuleLoader:createModuleLoader(),
    FieldLoader:createFieldLoader(),
    projectLoader:projectLoader()
}
export default entitieLoaders 