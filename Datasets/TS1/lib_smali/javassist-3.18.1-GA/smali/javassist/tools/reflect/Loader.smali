.class public Ljavassist/tools/reflect/Loader;
.super Ljavassist/Loader;
.source "Loader.java"


# instance fields
.field protected reflection:Ljavassist/tools/reflect/Reflection;


# direct methods
.method public constructor <init>()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 133
    invoke-direct {p0}, Ljavassist/Loader;-><init>()V

    .line 134
    const-string v1, "javassist.tools.reflect.Loader"

    invoke-virtual {p0, v1}, Ljavassist/tools/reflect/Loader;->delegateLoadingOf(Ljava/lang/String;)V

    .line 136
    new-instance v1, Ljavassist/tools/reflect/Reflection;

    invoke-direct {v1}, Ljavassist/tools/reflect/Reflection;-><init>()V

    iput-object v1, p0, Ljavassist/tools/reflect/Loader;->reflection:Ljavassist/tools/reflect/Reflection;

    .line 137
    invoke-static {}, Ljavassist/ClassPool;->getDefault()Ljavassist/ClassPool;

    move-result-object v0

    .line 138
    .local v0, "pool":Ljavassist/ClassPool;
    iget-object v1, p0, Ljavassist/tools/reflect/Loader;->reflection:Ljavassist/tools/reflect/Reflection;

    invoke-virtual {p0, v0, v1}, Ljavassist/tools/reflect/Loader;->addTranslator(Ljavassist/ClassPool;Ljavassist/Translator;)V

    .line 139
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 2
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 125
    new-instance v0, Ljavassist/tools/reflect/Loader;

    invoke-direct {v0}, Ljavassist/tools/reflect/Loader;-><init>()V

    .line 126
    .local v0, "cl":Ljavassist/tools/reflect/Loader;
    invoke-virtual {v0, p0}, Ljavassist/tools/reflect/Loader;->run([Ljava/lang/String;)V

    .line 127
    return-void
.end method


# virtual methods
.method public makeReflective(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "clazz"    # Ljava/lang/String;
    .param p2, "metaobject"    # Ljava/lang/String;
    .param p3, "metaclass"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v0, p0, Ljavassist/tools/reflect/Loader;->reflection:Ljavassist/tools/reflect/Reflection;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/tools/reflect/Reflection;->makeReflective(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
