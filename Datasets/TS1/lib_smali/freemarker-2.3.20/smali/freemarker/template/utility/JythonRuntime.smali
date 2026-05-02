.class public Lfreemarker/template/utility/JythonRuntime;
.super Lorg/python/util/PythonInterpreter;
.source "JythonRuntime.java"

# interfaces
.implements Lfreemarker/template/TemplateTransformModel;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 70
    invoke-direct {p0}, Lorg/python/util/PythonInterpreter;-><init>()V

    return-void
.end method

.method static access$000(Lfreemarker/template/utility/JythonRuntime;)Lorg/python/core/PySystemState;
    .registers 2
    .param p0, "x0"    # Lfreemarker/template/utility/JythonRuntime;

    .prologue
    .line 70
    iget-object v0, p0, Lfreemarker/template/utility/JythonRuntime;->systemState:Lorg/python/core/PySystemState;

    return-object v0
.end method


# virtual methods
.method public getWriter(Ljava/io/Writer;Ljava/util/Map;)Ljava/io/Writer;
    .registers 6
    .param p1, "out"    # Ljava/io/Writer;
    .param p2, "args"    # Ljava/util/Map;

    .prologue
    .line 76
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 77
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v1

    .line 78
    .local v1, "env":Lfreemarker/core/Environment;
    new-instance v2, Lfreemarker/template/utility/JythonRuntime$1;

    invoke-direct {v2, p0, v0, p1, v1}, Lfreemarker/template/utility/JythonRuntime$1;-><init>(Lfreemarker/template/utility/JythonRuntime;Ljava/lang/StringBuffer;Ljava/io/Writer;Lfreemarker/core/Environment;)V

    return-object v2
.end method
