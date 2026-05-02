.class public Lfreemarker/core/_CoreAPI;
.super Ljava/lang/Object;
.source "_CoreAPI.java"


# static fields
.field public static final STACK_SECTION_SEPARATOR:Ljava/lang/String; = "----------"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstructionStackSnapshot(Lfreemarker/core/Environment;)[Lfreemarker/core/TemplateElement;
    .registers 2
    .param p0, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 33
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getInstructionStackSnapshot()[Lfreemarker/core/TemplateElement;

    move-result-object v0

    return-object v0
.end method

.method public static getSupportedBuiltInNames()Ljava/util/Set;
    .registers 1

    .prologue
    .line 25
    sget-object v0, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static instructionStackItemToString(Lfreemarker/core/TemplateElement;)Ljava/lang/String;
    .registers 2
    .param p0, "stackEl"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 29
    invoke-static {p0}, Lfreemarker/core/Environment;->instructionStackItemToString(Lfreemarker/core/TemplateElement;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static outputInstructionStack([Lfreemarker/core/TemplateElement;Ljava/io/PrintWriter;)V
    .registers 2
    .param p0, "instructionStackSnapshot"    # [Lfreemarker/core/TemplateElement;
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 38
    invoke-static {p0, p1}, Lfreemarker/core/Environment;->outputInstructionStack([Lfreemarker/core/TemplateElement;Ljava/io/PrintWriter;)V

    .line 39
    return-void
.end method
