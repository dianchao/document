> Dougli->Atomic原子包

1、全面走一遍Atomic包下面的原子类

2、CAS->原子比较与交换算法的bug-ABA

3、魔法类->Unsafe,jni->堆外内存

1、atomic底层实现是基于无锁算法cas

基于魔术类Unsafe提供的三大cas-api完成

```
compareAndSwapObject
compareAndSwapInt
compareAndSwapLong
基于硬件原语-CMPXCHG实现原子操作cas
```

```java
AtomicInteger分析
    
do {
    oldvalue = this.getIntVolatile(var1, var2);//读AtomicInteger的value值
    ///valueOffset---value属性在对象内存当中的偏移量
} while(!this.compareAndSwapInt(AtomicInteger, valueOffset, oldvalue, oldvalue + 1));
return var5;

什么叫偏移量？
要用cas修改某个对象属性的值->，首先要知道属性在对象的内存空间的哪个位置，必须知道属性的偏移量
    

```

如果说要原子修改的属性是一个Array？

提供数组的cas修改

如果不是整形数组？可以改？



CAS修改的ABA问题！

王百万： 打算往自己账户100w,先查一下自w己账户：有多少钱->100W,在柜台查的，撩妹->耽误时间（1小时），

撩妹聊完了，又查了一下自己的户头，100w；

张三：去老王账户100w->非法转入股票市场户口(此时老王账户0)->炒股做T的高手(低买高卖)-->150w->100W又转回老王的户头，张三赚了50w

ABA-》怎么解决？

A-0->B-1->A-2->B-3->A-4

```
AtomicStampedReference(V initialRef, int initialStamp)

//initialRef要改的初始值，initialStamp-初始版本号
操作线程Thread[主操作线程,5,main]stamp=0,初始值 a = 1
操作线程Thread[干扰线程,5,main]stamp=1,【increment】 ,值 = 2
操作线程Thread[干扰线程,5,main]stamp=2,【decrement】 ,值 = 1
操作线程Thread[主操作线程,5,main]stamp=0,CAS操作结果: false
```

> Unsafe jdk1.7之后，加的api

内存管理：

举个例子：文件上传，并发量也比较高；可以用unsafe申请堆外内存

堆外内存不属于GC管，注意用完一定要手动释放。否则内存泄露

