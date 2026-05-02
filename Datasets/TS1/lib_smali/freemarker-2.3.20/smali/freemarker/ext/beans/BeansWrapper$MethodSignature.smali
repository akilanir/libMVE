.class final Lfreemarker/ext/beans/BeansWrapper$MethodSignature;
.super Ljava/lang/Object;
.source "BeansWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/beans/BeansWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MethodSignature"
.end annotation


# static fields
.field private static final GET_OBJECT_SIGNATURE:Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

.field private static final GET_STRING_SIGNATURE:Lfreemarker/ext/beans/BeansWrapper$MethodSignature;


# instance fields
.field private final args:[Ljava/lang/Class;

.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1552
    new-instance v0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    const-string v1, "get"

    new-array v2, v5, [Ljava/lang/Class;

    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->access$400()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-direct {v0, v1, v2}, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->GET_STRING_SIGNATURE:Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    .line 1554
    new-instance v0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    const-string v1, "get"

    new-array v2, v5, [Ljava/lang/Class;

    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->access$500()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-direct {v0, v1, v2}, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->GET_OBJECT_SIGNATURE:Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;[Ljava/lang/Class;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Class;

    .prologue
    .line 1561
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1562
    iput-object p1, p0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->name:Ljava/lang/String;

    .line 1563
    iput-object p2, p0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->args:[Ljava/lang/Class;

    .line 1564
    return-void
.end method

.method constructor <init>(Ljava/lang/reflect/Method;)V
    .registers 4
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 1568
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    .line 1569
    return-void
.end method

.method static access$200()Lfreemarker/ext/beans/BeansWrapper$MethodSignature;
    .registers 1

    .prologue
    .line 1550
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->GET_STRING_SIGNATURE:Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    return-object v0
.end method

.method static access$300()Lfreemarker/ext/beans/BeansWrapper$MethodSignature;
    .registers 1

    .prologue
    .line 1550
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->GET_OBJECT_SIGNATURE:Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1573
    instance-of v2, p1, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    if-eqz v2, :cond_1d

    move-object v0, p1

    .line 1575
    check-cast v0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    .line 1576
    .local v0, "ms":Lfreemarker/ext/beans/BeansWrapper$MethodSignature;
    iget-object v2, v0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->name:Ljava/lang/String;

    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    iget-object v2, p0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->args:[Ljava/lang/Class;

    iget-object v3, v0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->args:[Ljava/lang/Class;

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    const/4 v1, 0x1

    .line 1578
    .end local v0    # "ms":Lfreemarker/ext/beans/BeansWrapper$MethodSignature;
    :cond_1d
    return v1
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 1583
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->args:[Ljava/lang/Class;

    array-length v1, v1

    xor-int/2addr v0, v1

    return v0
.end method
