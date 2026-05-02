.class public Lfreemarker/ext/jython/_Jython25VersionAdapter;
.super Lfreemarker/ext/jython/JythonVersionAdapter;
.source "_Jython25VersionAdapter.java"


# static fields
.field static class$java$lang$Object:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Lfreemarker/ext/jython/JythonVersionAdapter;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 19
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public getPythonClassName(Lorg/python/core/PyObject;)Ljava/lang/String;
    .registers 3
    .param p1, "pyObject"    # Lorg/python/core/PyObject;

    .prologue
    .line 23
    invoke-virtual {p1}, Lorg/python/core/PyObject;->getType()Lorg/python/core/PyType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/python/core/PyType;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isPyInstance(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 15
    instance-of v0, p1, Lorg/python/core/PyInstance;

    return v0
.end method

.method public pyInstanceToJava(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "pyInstance"    # Ljava/lang/Object;

    .prologue
    .line 19
    check-cast p1, Lorg/python/core/PyInstance;

    .end local p1    # "pyInstance":Ljava/lang/Object;
    sget-object v0, Lfreemarker/ext/jython/_Jython25VersionAdapter;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v0, :cond_13

    const-string v0, "java.lang.Object"

    invoke-static {v0}, Lfreemarker/ext/jython/_Jython25VersionAdapter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jython/_Jython25VersionAdapter;->class$java$lang$Object:Ljava/lang/Class;

    :goto_e
    invoke-virtual {p1, v0}, Lorg/python/core/PyInstance;->__tojava__(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_13
    sget-object v0, Lfreemarker/ext/jython/_Jython25VersionAdapter;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_e
.end method
