.class Lcom/mikepenz/iconics/context/InternalLayoutInflater;
.super Landroid/view/LayoutInflater;
.source "InternalLayoutInflater.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/iconics/context/InternalLayoutInflater$PrivateWrapperFactory2;,
        Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;,
        Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;
    }
.end annotation


# static fields
.field private static final sClassPrefixList:[Ljava/lang/String;


# instance fields
.field private mConstructorArgs:Ljava/lang/reflect/Field;

.field private final mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

.field private mSetPrivateFactory:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 22
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.widget."

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "android.webkit."

    aput-object v2, v0, v1

    sput-object v0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->sClassPrefixList:[Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 33
    invoke-direct {p0, p1}, Landroid/view/LayoutInflater;-><init>(Landroid/content/Context;)V

    .line 29
    iput-boolean v1, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mSetPrivateFactory:Z

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mConstructorArgs:Ljava/lang/reflect/Field;

    .line 34
    new-instance v0, Lcom/mikepenz/iconics/context/IconicsFactory;

    invoke-direct {v0}, Lcom/mikepenz/iconics/context/IconicsFactory;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    .line 35
    invoke-direct {p0, v1}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->setUpLayoutFactories(Z)V

    .line 36
    return-void
.end method

.method protected constructor <init>(Landroid/view/LayoutInflater;Landroid/content/Context;Z)V
    .registers 5
    .param p1, "original"    # Landroid/view/LayoutInflater;
    .param p2, "newContext"    # Landroid/content/Context;
    .param p3, "cloned"    # Z

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Landroid/view/LayoutInflater;-><init>(Landroid/view/LayoutInflater;Landroid/content/Context;)V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mSetPrivateFactory:Z

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mConstructorArgs:Ljava/lang/reflect/Field;

    .line 40
    new-instance v0, Lcom/mikepenz/iconics/context/IconicsFactory;

    invoke-direct {v0}, Lcom/mikepenz/iconics/context/IconicsFactory;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    .line 41
    invoke-direct {p0, p3}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->setUpLayoutFactories(Z)V

    .line 42
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/iconics/context/InternalLayoutInflater;Landroid/view/View;Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 7
    .param p0, "x0"    # Lcom/mikepenz/iconics/context/InternalLayoutInflater;
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # Landroid/view/View;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Landroid/content/Context;
    .param p5, "x5"    # Landroid/util/AttributeSet;

    .prologue
    .line 20
    invoke-direct/range {p0 .. p5}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->createCustomViewInternal(Landroid/view/View;Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private createCustomViewInternal(Landroid/view/View;Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 13
    .param p1, "parent"    # Landroid/view/View;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "viewContext"    # Landroid/content/Context;
    .param p5, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v6, 0x0

    .line 156
    const/4 v0, 0x1

    .line 157
    .local v0, "customViewCreation":Z
    if-nez v0, :cond_6

    move-object v3, p2

    .line 180
    .end local p2    # "view":Landroid/view/View;
    .local v3, "view":Landroid/view/View;
    :goto_5
    return-object v3

    .line 160
    .end local v3    # "view":Landroid/view/View;
    .restart local p2    # "view":Landroid/view/View;
    :cond_6
    if-nez p2, :cond_3f

    const/16 v4, 0x2e

    invoke-virtual {p3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-le v4, v5, :cond_3f

    .line 161
    iget-object v4, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mConstructorArgs:Ljava/lang/reflect/Field;

    if-nez v4, :cond_1f

    .line 162
    const-class v4, Landroid/view/LayoutInflater;

    const-string v5, "mConstructorArgs"

    invoke-static {v4, v5}, Lcom/mikepenz/iconics/context/ReflectionUtils;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mConstructorArgs:Ljava/lang/reflect/Field;

    .line 165
    :cond_1f
    iget-object v4, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mConstructorArgs:Ljava/lang/reflect/Field;

    invoke-static {v4, p0}, Lcom/mikepenz/iconics/context/ReflectionUtils;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/Object;

    move-object v2, v4

    check-cast v2, [Ljava/lang/Object;

    .line 166
    .local v2, "mConstructorArgsArr":[Ljava/lang/Object;
    aget-object v1, v2, v6

    .line 170
    .local v1, "lastContext":Ljava/lang/Object;
    aput-object p4, v2, v6

    .line 171
    iget-object v4, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mConstructorArgs:Ljava/lang/reflect/Field;

    invoke-static {v4, p0, v2}, Lcom/mikepenz/iconics/context/ReflectionUtils;->setValue(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 173
    const/4 v4, 0x0

    :try_start_34
    invoke-virtual {p0, p3, v4, p5}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->createView(Ljava/lang/String;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;
    :try_end_37
    .catch Ljava/lang/ClassNotFoundException; {:try_start_34 .. :try_end_37} :catch_41
    .catchall {:try_start_34 .. :try_end_37} :catchall_4a

    move-result-object p2

    .line 176
    aput-object v1, v2, v6

    .line 177
    iget-object v4, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mConstructorArgs:Ljava/lang/reflect/Field;

    invoke-static {v4, p0, v2}, Lcom/mikepenz/iconics/context/ReflectionUtils;->setValue(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V

    .end local v1    # "lastContext":Ljava/lang/Object;
    .end local v2    # "mConstructorArgsArr":[Ljava/lang/Object;
    :cond_3f
    :goto_3f
    move-object v3, p2

    .line 180
    .end local p2    # "view":Landroid/view/View;
    .restart local v3    # "view":Landroid/view/View;
    goto :goto_5

    .line 174
    .end local v3    # "view":Landroid/view/View;
    .restart local v1    # "lastContext":Ljava/lang/Object;
    .restart local v2    # "mConstructorArgsArr":[Ljava/lang/Object;
    .restart local p2    # "view":Landroid/view/View;
    :catch_41
    move-exception v4

    .line 176
    aput-object v1, v2, v6

    .line 177
    iget-object v4, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mConstructorArgs:Ljava/lang/reflect/Field;

    invoke-static {v4, p0, v2}, Lcom/mikepenz/iconics/context/ReflectionUtils;->setValue(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_3f

    .line 176
    :catchall_4a
    move-exception v4

    aput-object v1, v2, v6

    .line 177
    iget-object v5, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mConstructorArgs:Ljava/lang/reflect/Field;

    invoke-static {v5, p0, v2}, Lcom/mikepenz/iconics/context/ReflectionUtils;->setValue(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V

    throw v4
.end method

.method private setPrivateFactoryInternal()V
    .registers 9

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 129
    iget-boolean v2, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mSetPrivateFactory:Z

    if-eqz v2, :cond_7

    .line 153
    :cond_6
    :goto_6
    return-void

    .line 133
    :cond_7
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v2, v5, :cond_1b

    move v0, v3

    .line 134
    .local v0, "reflection":Z
    :goto_e
    if-eqz v0, :cond_6

    .line 138
    invoke-virtual {p0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v2

    instance-of v2, v2, Landroid/view/LayoutInflater$Factory2;

    if-nez v2, :cond_1d

    .line 139
    iput-boolean v3, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mSetPrivateFactory:Z

    goto :goto_6

    .end local v0    # "reflection":Z
    :cond_1b
    move v0, v4

    .line 133
    goto :goto_e

    .line 143
    .restart local v0    # "reflection":Z
    :cond_1d
    const-class v2, Landroid/view/LayoutInflater;

    const-string v5, "setPrivateFactory"

    .line 144
    invoke-static {v2, v5}, Lcom/mikepenz/iconics/context/ReflectionUtils;->getMethod(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 146
    .local v1, "setPrivateFactoryMethod":Ljava/lang/reflect/Method;
    if-eqz v1, :cond_3b

    .line 147
    new-array v5, v3, [Ljava/lang/Object;

    new-instance v6, Lcom/mikepenz/iconics/context/InternalLayoutInflater$PrivateWrapperFactory2;

    .line 150
    invoke-virtual {p0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/view/LayoutInflater$Factory2;

    iget-object v7, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    invoke-direct {v6, v2, p0, v7}, Lcom/mikepenz/iconics/context/InternalLayoutInflater$PrivateWrapperFactory2;-><init>(Landroid/view/LayoutInflater$Factory2;Lcom/mikepenz/iconics/context/InternalLayoutInflater;Lcom/mikepenz/iconics/context/IconicsFactory;)V

    aput-object v6, v5, v4

    .line 147
    invoke-static {p0, v1, v5}, Lcom/mikepenz/iconics/context/ReflectionUtils;->invokeMethod(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)V

    .line 152
    :cond_3b
    iput-boolean v3, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mSetPrivateFactory:Z

    goto :goto_6
.end method

.method private setUpLayoutFactories(Z)V
    .registers 4
    .param p1, "cloned"    # Z

    .prologue
    .line 89
    if-eqz p1, :cond_3

    .line 103
    :cond_2
    :goto_2
    return-void

    .line 93
    :cond_3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_1e

    .line 94
    invoke-virtual {p0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->getFactory2()Landroid/view/LayoutInflater$Factory2;

    move-result-object v0

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->getFactory2()Landroid/view/LayoutInflater$Factory2;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;

    if-nez v0, :cond_1e

    .line 96
    invoke-virtual {p0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->getFactory2()Landroid/view/LayoutInflater$Factory2;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->setFactory2(Landroid/view/LayoutInflater$Factory2;)V

    .line 100
    :cond_1e
    invoke-virtual {p0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->getFactory()Landroid/view/LayoutInflater$Factory;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->getFactory()Landroid/view/LayoutInflater$Factory;

    move-result-object v0

    instance-of v0, v0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;

    if-nez v0, :cond_2

    .line 101
    invoke-virtual {p0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->getFactory()Landroid/view/LayoutInflater$Factory;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->setFactory(Landroid/view/LayoutInflater$Factory;)V

    goto :goto_2
.end method


# virtual methods
.method public cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;
    .registers 4
    .param p1, "newContext"    # Landroid/content/Context;

    .prologue
    .line 46
    new-instance v0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;-><init>(Landroid/view/LayoutInflater;Landroid/content/Context;Z)V

    return-object v0
.end method

.method public inflate(Lorg/xmlpull/v1/XmlPullParser;Landroid/view/ViewGroup;Z)Landroid/view/View;
    .registers 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "root"    # Landroid/view/ViewGroup;
    .param p3, "attachToRoot"    # Z

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->setPrivateFactoryInternal()V

    .line 81
    invoke-super {p0, p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(Lorg/xmlpull/v1/XmlPullParser;Landroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 7
    .param p1, "parent"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    .line 70
    invoke-super {p0, p1, p2, p3}, Landroid/view/LayoutInflater;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v1

    .line 71
    invoke-virtual {p0}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 69
    invoke-virtual {v0, v1, v2, p3}, Lcom/mikepenz/iconics/context/IconicsFactory;->onViewCreated(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected onCreateView(Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 51
    const/4 v1, 0x0

    .line 52
    .local v1, "view":Landroid/view/View;
    sget-object v3, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->sClassPrefixList:[Ljava/lang/String;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v4, :cond_10

    aget-object v0, v3, v2

    .line 54
    .local v0, "prefix":Ljava/lang/String;
    :try_start_9
    invoke-virtual {p0, p1, v0, p2}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->createView(Ljava/lang/String;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;
    :try_end_c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_9 .. :try_end_c} :catch_21

    move-result-object v1

    .line 52
    :goto_d
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 60
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_10
    if-nez v1, :cond_16

    .line 61
    invoke-super {p0, p1, p2}, Landroid/view/LayoutInflater;->onCreateView(Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v1

    .line 64
    :cond_16
    iget-object v2, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v1, v3, p2}, Lcom/mikepenz/iconics/context/IconicsFactory;->onViewCreated(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v2

    return-object v2

    .line 55
    .restart local v0    # "prefix":Ljava/lang/String;
    :catch_21
    move-exception v5

    goto :goto_d
.end method

.method public setFactory(Landroid/view/LayoutInflater$Factory;)V
    .registers 4
    .param p1, "factory"    # Landroid/view/LayoutInflater$Factory;

    .prologue
    .line 108
    instance-of v0, p1, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;

    if-nez v0, :cond_f

    .line 109
    new-instance v0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;

    iget-object v1, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    invoke-direct {v0, p1, p0, v1}, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;-><init>(Landroid/view/LayoutInflater$Factory;Lcom/mikepenz/iconics/context/InternalLayoutInflater;Lcom/mikepenz/iconics/context/IconicsFactory;)V

    invoke-super {p0, v0}, Landroid/view/LayoutInflater;->setFactory(Landroid/view/LayoutInflater$Factory;)V

    .line 113
    :goto_e
    return-void

    .line 111
    :cond_f
    invoke-super {p0, p1}, Landroid/view/LayoutInflater;->setFactory(Landroid/view/LayoutInflater$Factory;)V

    goto :goto_e
.end method

.method public setFactory2(Landroid/view/LayoutInflater$Factory2;)V
    .registers 4
    .param p1, "factory2"    # Landroid/view/LayoutInflater$Factory2;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 119
    instance-of v0, p1, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;

    if-nez v0, :cond_f

    .line 121
    new-instance v0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;

    iget-object v1, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    invoke-direct {v0, p1, v1}, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;-><init>(Landroid/view/LayoutInflater$Factory2;Lcom/mikepenz/iconics/context/IconicsFactory;)V

    invoke-super {p0, v0}, Landroid/view/LayoutInflater;->setFactory2(Landroid/view/LayoutInflater$Factory2;)V

    .line 125
    :goto_e
    return-void

    .line 123
    :cond_f
    invoke-super {p0, p1}, Landroid/view/LayoutInflater;->setFactory2(Landroid/view/LayoutInflater$Factory2;)V

    goto :goto_e
.end method
