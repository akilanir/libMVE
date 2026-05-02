.class public Lfreemarker/template/TemplateException;
.super Ljava/lang/Exception;
.source "TemplateException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/template/TemplateException$PrintWriterStackTraceWriter;,
        Lfreemarker/template/TemplateException$PrintStreamStackTraceWriter;,
        Lfreemarker/template/TemplateException$StackTraceWriter;
    }
.end annotation


# static fields
.field private static final BEFORE_1_4:Z

.field private static final EMPTY_CLASS_ARRAY:[Ljava/lang/Class;

.field private static final EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

.field private static final THE_FAILING_INSTRUCTION:Ljava/lang/String; = "The failing instruction"

.field static class$java$lang$Exception:Ljava/lang/Class;


# instance fields
.field private final causeException:Ljava/lang/Throwable;

.field private description:Ljava/lang/String;

.field private transient descriptionBuilder:Lfreemarker/core/_ErrorDescriptionBuilder;

.field private final transient env:Lfreemarker/core/Environment;

.field private transient ftlInstructionStackSnapshot:[Lfreemarker/core/TemplateElement;

.field private transient lock:Ljava/lang/Object;

.field private transient message:Ljava/lang/String;

.field private transient messageWasAlreadyPrintedForThisTrace:Ljava/lang/ThreadLocal;

.field private transient messageWithoutStackTop:Ljava/lang/String;

.field private renderedFtlInstructionStackSnapshot:Ljava/lang/String;

.field private renderedFtlInstructionStackSnapshotTop:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 77
    invoke-static {}, Lfreemarker/template/TemplateException;->before14()Z

    move-result v0

    sput-boolean v0, Lfreemarker/template/TemplateException;->BEFORE_1_4:Z

    .line 88
    new-array v0, v1, [Ljava/lang/Class;

    sput-object v0, Lfreemarker/template/TemplateException;->EMPTY_CLASS_ARRAY:[Ljava/lang/Class;

    .line 90
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lfreemarker/template/TemplateException;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    const/4 v1, 0x0

    .line 114
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0, v1, p1}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Ljava/lang/Exception;Lfreemarker/core/Environment;)V

    .line 115
    return-void
.end method

.method public constructor <init>(Ljava/lang/Exception;Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Exception;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 132
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Ljava/lang/Exception;Lfreemarker/core/Environment;)V

    .line 133
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 124
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Ljava/lang/Exception;Lfreemarker/core/Environment;)V

    .line 125
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;Lfreemarker/core/Environment;)V
    .registers 5
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Exception;
    .param p3, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 153
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V

    .line 154
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;Lfreemarker/core/Environment;)V
    .registers 5
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .param p3, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 167
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V

    .line 168
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V
    .registers 6
    .param p1, "renderedDescription"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .param p4, "descriptionBuilder"    # Lfreemarker/core/_ErrorDescriptionBuilder;

    .prologue
    .line 186
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 106
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lfreemarker/template/TemplateException;->lock:Ljava/lang/Object;

    .line 188
    if-nez p3, :cond_10

    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object p3

    .line 189
    :cond_10
    iput-object p3, p0, Lfreemarker/template/TemplateException;->env:Lfreemarker/core/Environment;

    .line 191
    iput-object p2, p0, Lfreemarker/template/TemplateException;->causeException:Ljava/lang/Throwable;

    .line 193
    iput-object p4, p0, Lfreemarker/template/TemplateException;->descriptionBuilder:Lfreemarker/core/_ErrorDescriptionBuilder;

    .line 194
    iput-object p1, p0, Lfreemarker/template/TemplateException;->description:Ljava/lang/String;

    .line 196
    if-eqz p3, :cond_20

    invoke-static {p3}, Lfreemarker/core/_CoreAPI;->getInstructionStackSnapshot(Lfreemarker/core/Environment;)[Lfreemarker/core/TemplateElement;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/TemplateException;->ftlInstructionStackSnapshot:[Lfreemarker/core/TemplateElement;

    .line 197
    :cond_20
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 145
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lfreemarker/core/Environment;)V

    .line 146
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V
    .registers 6
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "descriptionBuilder"    # Lfreemarker/core/_ErrorDescriptionBuilder;
    .param p4, "preventAmbiguity"    # Z

    .prologue
    .line 177
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V

    .line 178
    return-void
.end method

.method private static before14()Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 79
    sget-object v3, Lfreemarker/template/TemplateException;->class$java$lang$Exception:Ljava/lang/Class;

    if-nez v3, :cond_16

    const-string v3, "java.lang.Exception"

    invoke-static {v3}, Lfreemarker/template/TemplateException;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/template/TemplateException;->class$java$lang$Exception:Ljava/lang/Class;

    .line 81
    .local v1, "ec":Ljava/lang/Class;
    :goto_d
    :try_start_d
    const-string v3, "getCause"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_15
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_15} :catch_19

    .line 85
    :goto_15
    return v2

    .line 79
    .end local v1    # "ec":Ljava/lang/Class;
    :cond_16
    sget-object v1, Lfreemarker/template/TemplateException;->class$java$lang$Exception:Ljava/lang/Class;

    goto :goto_d

    .line 82
    .restart local v1    # "ec":Ljava/lang/Class;
    :catch_19
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/Throwable;
    const/4 v2, 0x1

    goto :goto_15
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 79
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

.method private deleteFTLInstructionStackSnapshotIfNotNeeded()V
    .registers 2

    .prologue
    .line 300
    iget-object v0, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshot:Ljava/lang/String;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshotTop:Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 301
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/template/TemplateException;->ftlInstructionStackSnapshot:[Lfreemarker/core/TemplateElement;

    .line 304
    :cond_b
    return-void
.end method

.method private getDescription()Ljava/lang/String;
    .registers 4

    .prologue
    .line 307
    iget-object v1, p0, Lfreemarker/template/TemplateException;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 308
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/TemplateException;->description:Ljava/lang/String;

    if-nez v0, :cond_1a

    iget-object v0, p0, Lfreemarker/template/TemplateException;->descriptionBuilder:Lfreemarker/core/_ErrorDescriptionBuilder;

    if-eqz v0, :cond_1a

    .line 309
    iget-object v0, p0, Lfreemarker/template/TemplateException;->descriptionBuilder:Lfreemarker/core/_ErrorDescriptionBuilder;

    invoke-direct {p0}, Lfreemarker/template/TemplateException;->getFailingInstruction()Lfreemarker/core/TemplateElement;

    move-result-object v2

    invoke-virtual {v0, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;->toString(Lfreemarker/core/TemplateElement;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/TemplateException;->description:Ljava/lang/String;

    .line 310
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/template/TemplateException;->descriptionBuilder:Lfreemarker/core/_ErrorDescriptionBuilder;

    .line 312
    :cond_1a
    iget-object v0, p0, Lfreemarker/template/TemplateException;->description:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    .line 313
    :catchall_1e
    move-exception v0

    monitor-exit v1
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_1e

    throw v0
.end method

.method private getFTLInstructionStackTop()Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v2, 0x0

    .line 275
    iget-object v4, p0, Lfreemarker/template/TemplateException;->lock:Ljava/lang/Object;

    monitor-enter v4

    .line 276
    :try_start_4
    iget-object v3, p0, Lfreemarker/template/TemplateException;->ftlInstructionStackSnapshot:[Lfreemarker/core/TemplateElement;

    if-nez v3, :cond_c

    iget-object v3, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshotTop:Ljava/lang/String;

    if-eqz v3, :cond_6e

    .line 277
    :cond_c
    iget-object v3, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshotTop:Ljava/lang/String;

    if-nez v3, :cond_20

    .line 278
    iget-object v3, p0, Lfreemarker/template/TemplateException;->ftlInstructionStackSnapshot:[Lfreemarker/core/TemplateElement;

    array-length v1, v3

    .line 280
    .local v1, "stackSize":I
    if-nez v1, :cond_2c

    .line 281
    const-string v0, ""

    .line 287
    .local v0, "s":Ljava/lang/String;
    :goto_17
    iget-object v3, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshotTop:Ljava/lang/String;

    if-nez v3, :cond_20

    .line 288
    iput-object v0, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshotTop:Ljava/lang/String;

    .line 289
    invoke-direct {p0}, Lfreemarker/template/TemplateException;->deleteFTLInstructionStackSnapshotIfNotNeeded()V

    .line 292
    .end local v0    # "s":Ljava/lang/String;
    .end local v1    # "stackSize":I
    :cond_20
    iget-object v3, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshotTop:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2a

    iget-object v2, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshotTop:Ljava/lang/String;

    :cond_2a
    monitor-exit v4

    .line 294
    :goto_2b
    return-object v2

    .line 283
    .restart local v1    # "stackSize":I
    :cond_2c
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v3, 0x1

    if-le v1, v3, :cond_6b

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, " (print stack trace for "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    add-int/lit8 v6, v1, -0x1

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v6, " more)"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_4f
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, ":\n==> "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v5, p0, Lfreemarker/template/TemplateException;->ftlInstructionStackSnapshot:[Lfreemarker/core/TemplateElement;

    const/4 v6, 0x0

    aget-object v5, v5, v6

    invoke-static {v5}, Lfreemarker/core/_CoreAPI;->instructionStackItemToString(Lfreemarker/core/TemplateElement;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "s":Ljava/lang/String;
    goto :goto_17

    .end local v0    # "s":Ljava/lang/String;
    :cond_6b
    const-string v3, ""

    goto :goto_4f

    .line 294
    .end local v1    # "stackSize":I
    :cond_6e
    monitor-exit v4

    goto :goto_2b

    .line 296
    :catchall_70
    move-exception v2

    monitor-exit v4
    :try_end_72
    .catchall {:try_start_4 .. :try_end_72} :catchall_70

    throw v2
.end method

.method private getFailingInstruction()Lfreemarker/core/TemplateElement;
    .registers 3

    .prologue
    .line 317
    iget-object v0, p0, Lfreemarker/template/TemplateException;->ftlInstructionStackSnapshot:[Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lfreemarker/template/TemplateException;->ftlInstructionStackSnapshot:[Lfreemarker/core/TemplateElement;

    array-length v0, v0

    if-lez v0, :cond_f

    .line 318
    iget-object v0, p0, Lfreemarker/template/TemplateException;->ftlInstructionStackSnapshot:[Lfreemarker/core/TemplateElement;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 320
    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private printStackTrace(Lfreemarker/template/TemplateException$StackTraceWriter;ZZZ)V
    .registers 12
    .param p1, "out"    # Lfreemarker/template/TemplateException$StackTraceWriter;
    .param p2, "heading"    # Z
    .param p3, "ftlStackTrace"    # Z
    .param p4, "javaStackTrace"    # Z

    .prologue
    .line 373
    monitor-enter p1

    .line 374
    if-eqz p2, :cond_8

    .line 375
    :try_start_3
    const-string v4, "FreeMarker template error:"

    invoke-interface {p1, v4}, Lfreemarker/template/TemplateException$StackTraceWriter;->println(Ljava/lang/Object;)V

    .line 378
    :cond_8
    if-eqz p3, :cond_27

    .line 379
    invoke-virtual {p0}, Lfreemarker/template/TemplateException;->getFTLInstructionStack()Ljava/lang/String;

    move-result-object v3

    .line 380
    .local v3, "stackTrace":Ljava/lang/String;
    if-eqz v3, :cond_ad

    .line 381
    invoke-virtual {p0}, Lfreemarker/template/TemplateException;->getMessageWithoutStackTop()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v4}, Lfreemarker/template/TemplateException$StackTraceWriter;->println(Ljava/lang/Object;)V

    .line 382
    invoke-interface {p1}, Lfreemarker/template/TemplateException$StackTraceWriter;->println()V

    .line 383
    const-string v4, "The failing instruction"

    invoke-interface {p1, v4}, Lfreemarker/template/TemplateException$StackTraceWriter;->print(Ljava/lang/Object;)V

    .line 384
    const-string v4, " (FTL stack trace):"

    invoke-interface {p1, v4}, Lfreemarker/template/TemplateException$StackTraceWriter;->println(Ljava/lang/Object;)V

    .line 385
    invoke-interface {p1, v3}, Lfreemarker/template/TemplateException$StackTraceWriter;->print(Ljava/lang/Object;)V

    .line 392
    .end local v3    # "stackTrace":Ljava/lang/String;
    :cond_27
    :goto_27
    if-eqz p4, :cond_ab

    .line 393
    if-eqz p3, :cond_c0

    .line 394
    invoke-interface {p1}, Lfreemarker/template/TemplateException$StackTraceWriter;->println()V

    .line 395
    const-string v4, "Java stack trace (for programmers):"

    invoke-interface {p1, v4}, Lfreemarker/template/TemplateException$StackTraceWriter;->println(Ljava/lang/Object;)V

    .line 396
    const-string v4, "----------"

    invoke-interface {p1, v4}, Lfreemarker/template/TemplateException$StackTraceWriter;->println(Ljava/lang/Object;)V

    .line 397
    iget-object v5, p0, Lfreemarker/template/TemplateException;->lock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_3b
    .catchall {:try_start_3 .. :try_end_3b} :catchall_b4

    .line 398
    :try_start_3b
    iget-object v4, p0, Lfreemarker/template/TemplateException;->messageWasAlreadyPrintedForThisTrace:Ljava/lang/ThreadLocal;

    if-nez v4, :cond_46

    .line 399
    new-instance v4, Ljava/lang/ThreadLocal;

    invoke-direct {v4}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v4, p0, Lfreemarker/template/TemplateException;->messageWasAlreadyPrintedForThisTrace:Ljava/lang/ThreadLocal;

    .line 401
    :cond_46
    iget-object v4, p0, Lfreemarker/template/TemplateException;->messageWasAlreadyPrintedForThisTrace:Ljava/lang/ThreadLocal;

    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, v6}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 402
    monitor-exit v5
    :try_end_4e
    .catchall {:try_start_3b .. :try_end_4e} :catchall_b1

    .line 405
    :try_start_4e
    invoke-interface {p1, p0}, Lfreemarker/template/TemplateException$StackTraceWriter;->printStandardStackTrace(Ljava/lang/Throwable;)V
    :try_end_51
    .catchall {:try_start_4e .. :try_end_51} :catchall_b7

    .line 407
    :try_start_51
    iget-object v4, p0, Lfreemarker/template/TemplateException;->messageWasAlreadyPrintedForThisTrace:Ljava/lang/ThreadLocal;

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 413
    :goto_58
    sget-boolean v4, Lfreemarker/template/TemplateException;->BEFORE_1_4:Z

    if-eqz v4, :cond_6a

    iget-object v4, p0, Lfreemarker/template/TemplateException;->causeException:Ljava/lang/Throwable;

    if-eqz v4, :cond_6a

    .line 414
    const-string v4, "Underlying cause: "

    invoke-interface {p1, v4}, Lfreemarker/template/TemplateException$StackTraceWriter;->println(Ljava/lang/Object;)V

    .line 415
    iget-object v4, p0, Lfreemarker/template/TemplateException;->causeException:Ljava/lang/Throwable;

    invoke-interface {p1, v4}, Lfreemarker/template/TemplateException$StackTraceWriter;->printStandardStackTrace(Ljava/lang/Throwable;)V
    :try_end_6a
    .catchall {:try_start_51 .. :try_end_6a} :catchall_b4

    .line 423
    :cond_6a
    :try_start_6a
    iget-object v4, p0, Lfreemarker/template/TemplateException;->causeException:Ljava/lang/Throwable;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getRootCause"

    sget-object v6, Lfreemarker/template/TemplateException;->EMPTY_CLASS_ARRAY:[Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 424
    .local v1, "m":Ljava/lang/reflect/Method;
    iget-object v4, p0, Lfreemarker/template/TemplateException;->causeException:Ljava/lang/Throwable;

    sget-object v5, Lfreemarker/template/TemplateException;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    invoke-virtual {v1, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    .line 425
    .local v2, "rootCause":Ljava/lang/Throwable;
    if-eqz v2, :cond_ab

    .line 426
    const/4 v0, 0x0

    .line 427
    .local v0, "j14Cause":Ljava/lang/Throwable;
    sget-boolean v4, Lfreemarker/template/TemplateException;->BEFORE_1_4:Z

    if-nez v4, :cond_a1

    .line 428
    iget-object v4, p0, Lfreemarker/template/TemplateException;->causeException:Ljava/lang/Throwable;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getCause"

    sget-object v6, Lfreemarker/template/TemplateException;->EMPTY_CLASS_ARRAY:[Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 429
    iget-object v4, p0, Lfreemarker/template/TemplateException;->causeException:Ljava/lang/Throwable;

    sget-object v5, Lfreemarker/template/TemplateException;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    invoke-virtual {v1, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "j14Cause":Ljava/lang/Throwable;
    check-cast v0, Ljava/lang/Throwable;

    .line 431
    .restart local v0    # "j14Cause":Ljava/lang/Throwable;
    :cond_a1
    if-nez v0, :cond_ab

    .line 432
    const-string v4, "ServletException root cause: "

    invoke-interface {p1, v4}, Lfreemarker/template/TemplateException$StackTraceWriter;->println(Ljava/lang/Object;)V

    .line 433
    invoke-interface {p1, v2}, Lfreemarker/template/TemplateException$StackTraceWriter;->printStandardStackTrace(Ljava/lang/Throwable;)V
    :try_end_ab
    .catch Ljava/lang/Throwable; {:try_start_6a .. :try_end_ab} :catch_c4
    .catchall {:try_start_6a .. :try_end_ab} :catchall_b4

    .line 440
    .end local v0    # "j14Cause":Ljava/lang/Throwable;
    .end local v1    # "m":Ljava/lang/reflect/Method;
    .end local v2    # "rootCause":Ljava/lang/Throwable;
    :cond_ab
    :goto_ab
    :try_start_ab
    monitor-exit p1
    :try_end_ac
    .catchall {:try_start_ab .. :try_end_ac} :catchall_b4

    .line 441
    return-void

    .line 387
    .restart local v3    # "stackTrace":Ljava/lang/String;
    :cond_ad
    const/4 p3, 0x0

    .line 388
    const/4 p4, 0x1

    goto/16 :goto_27

    .line 402
    .end local v3    # "stackTrace":Ljava/lang/String;
    :catchall_b1
    move-exception v4

    :try_start_b2
    monitor-exit v5
    :try_end_b3
    .catchall {:try_start_b2 .. :try_end_b3} :catchall_b1

    :try_start_b3
    throw v4

    .line 440
    :catchall_b4
    move-exception v4

    monitor-exit p1
    :try_end_b6
    .catchall {:try_start_b3 .. :try_end_b6} :catchall_b4

    throw v4

    .line 407
    :catchall_b7
    move-exception v4

    :try_start_b8
    iget-object v5, p0, Lfreemarker/template/TemplateException;->messageWasAlreadyPrintedForThisTrace:Ljava/lang/ThreadLocal;

    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v5, v6}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    throw v4

    .line 410
    :cond_c0
    invoke-interface {p1, p0}, Lfreemarker/template/TemplateException$StackTraceWriter;->printStandardStackTrace(Ljava/lang/Throwable;)V
    :try_end_c3
    .catchall {:try_start_b8 .. :try_end_c3} :catchall_b4

    goto :goto_58

    .line 436
    :catch_c4
    move-exception v4

    goto :goto_ab
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 492
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lfreemarker/template/TemplateException;->lock:Ljava/lang/Object;

    .line 493
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 494
    return-void
.end method

.method private renderMessages()V
    .registers 6

    .prologue
    .line 200
    invoke-direct {p0}, Lfreemarker/template/TemplateException;->getDescription()Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "description":Ljava/lang/String;
    if-eqz v0, :cond_45

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_45

    .line 203
    iput-object v0, p0, Lfreemarker/template/TemplateException;->messageWithoutStackTop:Ljava/lang/String;

    .line 211
    :goto_e
    invoke-direct {p0}, Lfreemarker/template/TemplateException;->getFTLInstructionStackTop()Ljava/lang/String;

    move-result-object v1

    .line 212
    .local v1, "stackTop":Ljava/lang/String;
    if-eqz v1, :cond_84

    .line 213
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lfreemarker/template/TemplateException;->messageWithoutStackTop:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\n\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "The failing instruction"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lfreemarker/template/TemplateException;->message:Ljava/lang/String;

    .line 214
    iget-object v2, p0, Lfreemarker/template/TemplateException;->message:Ljava/lang/String;

    const/4 v3, 0x0

    iget-object v4, p0, Lfreemarker/template/TemplateException;->messageWithoutStackTop:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lfreemarker/template/TemplateException;->messageWithoutStackTop:Ljava/lang/String;

    .line 218
    :goto_44
    return-void

    .line 204
    .end local v1    # "stackTop":Ljava/lang/String;
    :cond_45
    invoke-virtual {p0}, Lfreemarker/template/TemplateException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_7f

    .line 205
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No error description was specified for this error; low-level message: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lfreemarker/template/TemplateException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lfreemarker/template/TemplateException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lfreemarker/template/TemplateException;->messageWithoutStackTop:Ljava/lang/String;

    goto :goto_e

    .line 208
    :cond_7f
    const-string v2, "[No error description was available.]"

    iput-object v2, p0, Lfreemarker/template/TemplateException;->messageWithoutStackTop:Ljava/lang/String;

    goto :goto_e

    .line 216
    .restart local v1    # "stackTop":Ljava/lang/String;
    :cond_84
    iget-object v2, p0, Lfreemarker/template/TemplateException;->messageWithoutStackTop:Ljava/lang/String;

    iput-object v2, p0, Lfreemarker/template/TemplateException;->message:Ljava/lang/String;

    goto :goto_44
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 2
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 484
    invoke-virtual {p0}, Lfreemarker/template/TemplateException;->getFTLInstructionStack()Ljava/lang/String;

    .line 485
    invoke-direct {p0}, Lfreemarker/template/TemplateException;->getFTLInstructionStackTop()Ljava/lang/String;

    .line 486
    invoke-direct {p0}, Lfreemarker/template/TemplateException;->getDescription()Ljava/lang/String;

    .line 488
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 489
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 248
    iget-object v0, p0, Lfreemarker/template/TemplateException;->causeException:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getCauseException()Ljava/lang/Exception;
    .registers 4

    .prologue
    .line 234
    iget-object v0, p0, Lfreemarker/template/TemplateException;->causeException:Ljava/lang/Throwable;

    instance-of v0, v0, Ljava/lang/Exception;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lfreemarker/template/TemplateException;->causeException:Ljava/lang/Throwable;

    check-cast v0, Ljava/lang/Exception;

    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Wrapped to Exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/template/TemplateException;->causeException:Ljava/lang/Throwable;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    goto :goto_a
.end method

.method public getEnvironment()Lfreemarker/core/Environment;
    .registers 2

    .prologue
    .line 329
    iget-object v0, p0, Lfreemarker/template/TemplateException;->env:Lfreemarker/core/Environment;

    return-object v0
.end method

.method public getFTLInstructionStack()Ljava/lang/String;
    .registers 5

    .prologue
    .line 255
    iget-object v3, p0, Lfreemarker/template/TemplateException;->lock:Ljava/lang/Object;

    monitor-enter v3

    .line 256
    :try_start_3
    iget-object v2, p0, Lfreemarker/template/TemplateException;->ftlInstructionStackSnapshot:[Lfreemarker/core/TemplateElement;

    if-nez v2, :cond_b

    iget-object v2, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshot:Ljava/lang/String;

    if-eqz v2, :cond_32

    .line 257
    :cond_b
    iget-object v2, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshot:Ljava/lang/String;

    if-nez v2, :cond_2e

    .line 258
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 259
    .local v1, "sw":Ljava/io/StringWriter;
    new-instance v0, Ljava/io/PrintWriter;

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 260
    .local v0, "pw":Ljava/io/PrintWriter;
    iget-object v2, p0, Lfreemarker/template/TemplateException;->ftlInstructionStackSnapshot:[Lfreemarker/core/TemplateElement;

    invoke-static {v2, v0}, Lfreemarker/core/_CoreAPI;->outputInstructionStack([Lfreemarker/core/TemplateElement;Ljava/io/PrintWriter;)V

    .line 261
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 262
    iget-object v2, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshot:Ljava/lang/String;

    if-nez v2, :cond_2e

    .line 263
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshot:Ljava/lang/String;

    .line 264
    invoke-direct {p0}, Lfreemarker/template/TemplateException;->deleteFTLInstructionStackSnapshotIfNotNeeded()V

    .line 267
    .end local v0    # "pw":Ljava/io/PrintWriter;
    .end local v1    # "sw":Ljava/io/StringWriter;
    :cond_2e
    iget-object v2, p0, Lfreemarker/template/TemplateException;->renderedFtlInstructionStackSnapshot:Ljava/lang/String;

    monitor-exit v3

    .line 269
    :goto_31
    return-object v2

    :cond_32
    const/4 v2, 0x0

    monitor-exit v3

    goto :goto_31

    .line 271
    :catchall_35
    move-exception v2

    monitor-exit v3
    :try_end_37
    .catchall {:try_start_3 .. :try_end_37} :catchall_35

    throw v2
.end method

.method public getMessage()Ljava/lang/String;
    .registers 3

    .prologue
    .line 460
    iget-object v0, p0, Lfreemarker/template/TemplateException;->messageWasAlreadyPrintedForThisTrace:Ljava/lang/ThreadLocal;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lfreemarker/template/TemplateException;->messageWasAlreadyPrintedForThisTrace:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_11

    .line 461
    const-string v0, "[... Exception message was already printed; see it above ...]"

    .line 465
    :goto_10
    return-object v0

    .line 463
    :cond_11
    iget-object v1, p0, Lfreemarker/template/TemplateException;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 464
    :try_start_14
    iget-object v0, p0, Lfreemarker/template/TemplateException;->message:Ljava/lang/String;

    if-nez v0, :cond_1b

    invoke-direct {p0}, Lfreemarker/template/TemplateException;->renderMessages()V

    .line 465
    :cond_1b
    iget-object v0, p0, Lfreemarker/template/TemplateException;->message:Ljava/lang/String;

    monitor-exit v1

    goto :goto_10

    .line 466
    :catchall_1f
    move-exception v0

    monitor-exit v1
    :try_end_21
    .catchall {:try_start_14 .. :try_end_21} :catchall_1f

    throw v0
.end method

.method public getMessageWithoutStackTop()Ljava/lang/String;
    .registers 3

    .prologue
    .line 476
    iget-object v1, p0, Lfreemarker/template/TemplateException;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 477
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/TemplateException;->messageWithoutStackTop:Ljava/lang/String;

    if-nez v0, :cond_a

    invoke-direct {p0}, Lfreemarker/template/TemplateException;->renderMessages()V

    .line 478
    :cond_a
    iget-object v0, p0, Lfreemarker/template/TemplateException;->messageWithoutStackTop:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    .line 479
    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public printStackTrace(Ljava/io/PrintStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintStream;

    .prologue
    const/4 v0, 0x1

    .line 336
    invoke-virtual {p0, p1, v0, v0, v0}, Lfreemarker/template/TemplateException;->printStackTrace(Ljava/io/PrintStream;ZZZ)V

    .line 337
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintStream;ZZZ)V
    .registers 6
    .param p1, "out"    # Ljava/io/PrintStream;
    .param p2, "heading"    # Z
    .param p3, "ftlStackTrace"    # Z
    .param p4, "javaStackTrace"    # Z

    .prologue
    .line 367
    monitor-enter p1

    .line 368
    :try_start_1
    new-instance v0, Lfreemarker/template/TemplateException$PrintStreamStackTraceWriter;

    invoke-direct {v0, p1}, Lfreemarker/template/TemplateException$PrintStreamStackTraceWriter;-><init>(Ljava/io/PrintStream;)V

    invoke-direct {p0, v0, p2, p3, p4}, Lfreemarker/template/TemplateException;->printStackTrace(Lfreemarker/template/TemplateException$StackTraceWriter;ZZZ)V

    .line 369
    monitor-exit p1

    .line 370
    return-void

    .line 369
    :catchall_b
    move-exception v0

    monitor-exit p1
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public printStackTrace(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    const/4 v0, 0x1

    .line 343
    invoke-virtual {p0, p1, v0, v0, v0}, Lfreemarker/template/TemplateException;->printStackTrace(Ljava/io/PrintWriter;ZZZ)V

    .line 344
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintWriter;ZZZ)V
    .registers 6
    .param p1, "out"    # Ljava/io/PrintWriter;
    .param p2, "heading"    # Z
    .param p3, "ftlStackTrace"    # Z
    .param p4, "javaStackTrace"    # Z

    .prologue
    .line 354
    monitor-enter p1

    .line 355
    :try_start_1
    new-instance v0, Lfreemarker/template/TemplateException$PrintWriterStackTraceWriter;

    invoke-direct {v0, p1}, Lfreemarker/template/TemplateException$PrintWriterStackTraceWriter;-><init>(Ljava/io/PrintWriter;)V

    invoke-direct {p0, v0, p2, p3, p4}, Lfreemarker/template/TemplateException;->printStackTrace(Lfreemarker/template/TemplateException$StackTraceWriter;ZZZ)V

    .line 356
    monitor-exit p1

    .line 357
    return-void

    .line 356
    :catchall_b
    move-exception v0

    monitor-exit p1
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public printStandardStackTrace(Ljava/io/PrintStream;)V
    .registers 2
    .param p1, "ps"    # Ljava/io/PrintStream;

    .prologue
    .line 448
    invoke-super {p0, p1}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 449
    return-void
.end method

.method public printStandardStackTrace(Ljava/io/PrintWriter;)V
    .registers 2
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 456
    invoke-super {p0, p1}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 457
    return-void
.end method
