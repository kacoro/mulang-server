import { createUserLoader } from "./createUserLoader";
import { createUpdootLoader } from "./createUpdootLoader";
import { createFieldLoader } from "./createFieldLoader";
import { createModuleLoader } from "./createModuleLoader";
const entitieLoaders = {
    UpdootLoader:createUpdootLoader(),
    UserLoader:createUserLoader(),
    ModuleLoader:createModuleLoader(),
    FieldLoader:createFieldLoader()
}
export default entitieLoaders