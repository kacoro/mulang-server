
interface treeType  {
    id:number
    children:treeType[]
}

const findTreeIds = (tree:treeType):any => {
    let arrs = [] as number[]
    
    if(tree.children){
         arrs = tree.children.map((item: treeType)=> {
             return findTreeIds(item).flat(Infinity)
        })
    }
    arrs.push(tree.id)
    return arrs.flat(Infinity)
}

export  default findTreeIds 