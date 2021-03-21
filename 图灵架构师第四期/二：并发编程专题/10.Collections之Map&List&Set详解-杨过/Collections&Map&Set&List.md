> HashMap

 1.7-hashtable = 数组（基础） + 链表 

 （>=）1.8 = 数组 + 链表 + 红黑树

HashMap->数组的大小

new HashMap（）；如果不写构造参数，默认大小16

如果说：写了初始容量：11 ？hashmap的容量就是11？

hashmap的get，put操作时间复杂度O(1)

key.hashCode = 不确定 - 有符号的整型值

key.hashCode % 16 = table.lenth = [0-15]  = index = 3;

array[index] = value; 

数组所有的元素位是否能够100%被利用起来？

不一定，hash碰

引入链表结构解决hash冲突，采用头部插入链表法，链表时间复杂度O(n)

hash并不是用取模计算index，而是用位运算！

效率：位运算>%

并没有说hashmap的容量一定是16，

```java
/** * The default initial capacity - MUST be a power of two. */必须是2的指数幂？

roundUpToPowerOf2(size)，强型将非2的指数次幂的数值转化成2的指数次幂
怎么转化？
1、必须最接近size，11
2、必须大于=size，
3、是2的指数次幂
16
size = 17，capacity = 32

为什么一定要转成2的指数次幂？
计算索引：int i = indexFor(hash, table.length);
static int indexFor(int h, int length) {
//  key.hashCode % table.lenth
	return h & (table.lenth-1);
}

h = 
0001 0101 0111 0010 1111
0001 0101 0000 0010 0000
16
    0
    
0000 0000 0000 0000 1111 16-1=15
0000 0000 0000 0000 1010
0-15
bit位运算：1815ms
mod取模运算：22282
效率差10倍

HashMap扩容，
当前hashmap存了多少element，size>=threshold
threshold扩容阈值 = capacity * 扩容阈值比率 0.75 = 16*0.75=12
扩容怎么扩？
扩容为原来的2倍。
转移数据
void transfer(Entry[] newTable, boolean rehash) {
        int newCapacity = newTable.length;
        for (Entry<K,V> e : table) {
            while(null != e) {
                Entry<K,V> next = e.next;
                if (rehash) { 
                    e.hash = null == e.key ? 0 : hash(e.key);//再一次进行hash计算？
                }
                int i = indexFor(e.hash, newCapacity);
                e.next = newTable[i];
                newTable[i] = e;
                e = next;
            }
        }
    }
    
链表成环，死锁问题

hash扩容，有个加载因子？loadfactor = 0.75为什么是0.75
0.5
1
牛顿二项式：基于空间与时间的折中考虑0.5

引入红黑树！
容量>=64才会链表转红黑树，否则优先扩容
只有等链表过长，阈值设置TREEIFY_THRESHOLD = 8，不是代表链表长度，链表长度>8,链表9的时候转红黑树
Node<K,V> loHead = null, loTail = null;
Node<K,V> hiHead = null, hiTail = null;
Node<K,V> next;
    do {
        next = e.next;
        if ((e.hash & oldCap) == 0) {
            //yangguo.hashcode & 16 = 0，用低位指针
            if (loTail == null)
                loHead = e;
            else
                loTail.next = e;
            loTail = e;
        }
        else {
             //yangguo.hashcode & 16 》 0 高位指针
            if (hiTail == null)
                hiHead = e;
            else
                hiTail.next = e;
            hiTail = e;
        }
    } while ((e = next) != null);
if (loTail != null) {
    loTail.next = null; 
    newTab[j] = loHead;，移到新的数组上的同样的index位置
}
if (hiTail != null) {
    hiTail.next = null;
    newTab[j + oldCap] = hiHead; //index 3+16 = 19
}
完全绕开rehash，要满足高低位移动，必须数组容量是2的幂次方

    
分库分表，在线扩容
    2台master tuling（1,2,3,4） -> 4台
```