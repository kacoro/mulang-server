
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

export default findTreeIds 

  export function listToTree(oldArr: any[]){
    oldArr.forEach(element => {
      let parentId = element.parentId;
      if(parentId !== 0){
        oldArr.forEach(ele => {
          if(ele.id == parentId){ //当内层循环的ID== 外层循环的parendId时，（说明有children），需要往该内层id里建个children并push对应的数组；
            if(!ele.children){
              ele.children = [];
            }
            ele.children.push(element);
          }
        });
      }
    });
    // console.log(oldArr) //此时的数组是在原基础上补充了children;
    oldArr = oldArr.filter(ele => ele.parentId === 0); //这一步是过滤，按树展开，将多余的数组剔除；
    // console.log(oldArr)
    return oldArr;
  }
