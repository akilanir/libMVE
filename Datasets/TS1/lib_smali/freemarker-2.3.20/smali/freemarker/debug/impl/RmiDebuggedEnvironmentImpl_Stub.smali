.class public final Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;
.super Ljava/rmi/server/RemoteStub;

# interfaces
.implements Lfreemarker/debug/DebuggedEnvironment;
.implements Lfreemarker/debug/DebugModel;
.implements Ljava/rmi/Remote;


# static fields
.field private static $method_getAsBoolean_4:Ljava/lang/reflect/Method; = null

.field private static $method_getAsDate_5:Ljava/lang/reflect/Method; = null

.field private static $method_getAsNumber_6:Ljava/lang/reflect/Method; = null

.field private static $method_getAsString_7:Ljava/lang/reflect/Method; = null

.field private static $method_getCollection_8:Ljava/lang/reflect/Method; = null

.field private static $method_getDateType_9:Ljava/lang/reflect/Method; = null

.field private static $method_getId_10:Ljava/lang/reflect/Method; = null

.field private static $method_getModelTypes_11:Ljava/lang/reflect/Method; = null

.field private static $method_get_0:Ljava/lang/reflect/Method; = null

.field private static $method_get_1:Ljava/lang/reflect/Method; = null

.field private static $method_get_2:Ljava/lang/reflect/Method; = null

.field private static $method_get_3:Ljava/lang/reflect/Method; = null

.field private static $method_keys_12:Ljava/lang/reflect/Method; = null

.field private static $method_resume_13:Ljava/lang/reflect/Method; = null

.field private static $method_size_14:Ljava/lang/reflect/Method; = null

.field private static $method_stop_15:Ljava/lang/reflect/Method; = null

.field static array$Ljava$lang$String:Ljava/lang/Class; = null

.field static class$freemarker$debug$DebugModel:Ljava/lang/Class; = null

.field static class$freemarker$debug$DebuggedEnvironment:Ljava/lang/Class; = null

.field static class$java$lang$String:Ljava/lang/Class; = null

.field private static final serialVersionUID:J = 0x2L


# direct methods
.method static constructor <clinit>()V
    .registers 5

    :try_start_0
    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_134

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    :goto_6
    const-string v1, "get"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_get_0:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_147

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    :goto_1c
    const-string v1, "get"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_get_1:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_151

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    move-object v1, v0

    :goto_38
    const-string v2, "get"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$java$lang$String:Ljava/lang/Class;

    if-eqz v0, :cond_15c

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$java$lang$String:Ljava/lang/Class;

    :goto_44
    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_get_2:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_166

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    move-object v1, v0

    :goto_53
    const-string v2, "get"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->array$Ljava$lang$String:Ljava/lang/Class;

    if-eqz v0, :cond_171

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->array$Ljava$lang$String:Ljava/lang/Class;

    :goto_5f
    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_get_3:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_17b

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    :goto_6d
    const-string v1, "getAsBoolean"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getAsBoolean_4:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_185

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    :goto_7e
    const-string v1, "getAsDate"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getAsDate_5:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_18f

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    :goto_8f
    const-string v1, "getAsNumber"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getAsNumber_6:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_199

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    :goto_a0
    const-string v1, "getAsString"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getAsString_7:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_1a3

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    :goto_b1
    const-string v1, "getCollection"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getCollection_8:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_1ad

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    :goto_c2
    const-string v1, "getDateType"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getDateType_9:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebuggedEnvironment:Ljava/lang/Class;

    if-eqz v0, :cond_1b7

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebuggedEnvironment:Ljava/lang/Class;

    :goto_d3
    const-string v1, "getId"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getId_10:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_1c1

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    :goto_e4
    const-string v1, "getModelTypes"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getModelTypes_11:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_1cb

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    :goto_f5
    const-string v1, "keys"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_keys_12:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebuggedEnvironment:Ljava/lang/Class;

    if-eqz v0, :cond_1d5

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebuggedEnvironment:Ljava/lang/Class;

    :goto_106
    const-string v1, "resume"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_resume_13:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    if-eqz v0, :cond_1df

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    :goto_117
    const-string v1, "size"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_size_14:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebuggedEnvironment:Ljava/lang/Class;

    if-eqz v0, :cond_1e9

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebuggedEnvironment:Ljava/lang/Class;

    :goto_128
    const-string v1, "stop"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_stop_15:Ljava/lang/reflect/Method;

    return-void

    :cond_134
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;
    :try_end_13c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_13c} :catch_13e

    goto/16 :goto_6

    :catch_13e
    move-exception v0

    new-instance v0, Ljava/lang/NoSuchMethodError;

    const-string v1, "stub class initialization failed"

    invoke-direct {v0, v1}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_147
    :try_start_147
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    goto/16 :goto_1c

    :cond_151
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_38

    :cond_15c
    const-string v0, "java.lang.String"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$java$lang$String:Ljava/lang/Class;

    goto/16 :goto_44

    :cond_166
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_53

    :cond_171
    const-string v0, "[Ljava.lang.String;"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->array$Ljava$lang$String:Ljava/lang/Class;

    goto/16 :goto_5f

    :cond_17b
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    goto/16 :goto_6d

    :cond_185
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    goto/16 :goto_7e

    :cond_18f
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    goto/16 :goto_8f

    :cond_199
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    goto/16 :goto_a0

    :cond_1a3
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    goto/16 :goto_b1

    :cond_1ad
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    goto/16 :goto_c2

    :cond_1b7
    const-string v0, "freemarker.debug.DebuggedEnvironment"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebuggedEnvironment:Ljava/lang/Class;

    goto/16 :goto_d3

    :cond_1c1
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    goto/16 :goto_e4

    :cond_1cb
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    goto/16 :goto_f5

    :cond_1d5
    const-string v0, "freemarker.debug.DebuggedEnvironment"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebuggedEnvironment:Ljava/lang/Class;

    goto/16 :goto_106

    :cond_1df
    const-string v0, "freemarker.debug.DebugModel"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebugModel:Ljava/lang/Class;

    goto/16 :goto_117

    :cond_1e9
    const-string v0, "freemarker.debug.DebuggedEnvironment"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->class$freemarker$debug$DebuggedEnvironment:Ljava/lang/Class;
    :try_end_1f1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_147 .. :try_end_1f1} :catch_13e

    goto/16 :goto_128
.end method

.method public constructor <init>(Ljava/rmi/server/RemoteRef;)V
    .registers 2

    invoke-direct {p0, p1}, Ljava/rmi/server/RemoteStub;-><init>(Ljava/rmi/server/RemoteRef;)V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3

    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    :catch_5
    move-exception v0

    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public get(I)Lfreemarker/debug/DebugModel;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_get_0:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, p1}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v3, v1

    const-wide v4, -0x70de6dd3c91dfd44L

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/debug/DebugModel;
    :try_end_1b
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_1b} :catch_1c
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_1b} :catch_1e
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_1b} :catch_20
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_22

    return-object v0

    :catch_1c
    move-exception v0

    throw v0

    :catch_1e
    move-exception v0

    throw v0

    :catch_20
    move-exception v0

    throw v0

    :catch_22
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public get(Ljava/lang/String;)Lfreemarker/debug/DebugModel;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_get_2:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v3, v1

    const-wide v4, -0xa0df77deb1cbf6cL

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/debug/DebugModel;
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_16} :catch_17
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_16} :catch_19
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_16} :catch_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_1d

    return-object v0

    :catch_17
    move-exception v0

    throw v0

    :catch_19
    move-exception v0

    throw v0

    :catch_1b
    move-exception v0

    throw v0

    :catch_1d
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public get(II)[Lfreemarker/debug/DebugModel;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_get_1:Ljava/lang/reflect/Method;

    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, p1}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v3, v1

    const/4 v1, 0x1

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, p2}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v3, v1

    const-wide v4, 0x291faa1540aacaebL

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lfreemarker/debug/DebugModel;
    :try_end_23
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_23} :catch_24
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_23} :catch_26
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_23} :catch_28
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_23} :catch_2a

    return-object v0

    :catch_24
    move-exception v0

    throw v0

    :catch_26
    move-exception v0

    throw v0

    :catch_28
    move-exception v0

    throw v0

    :catch_2a
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public get([Ljava/lang/String;)[Lfreemarker/debug/DebugModel;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_get_3:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v3, v1

    const-wide v4, -0x4af3919f76bdc859L    # -3.710439576083808E-53

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lfreemarker/debug/DebugModel;
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_16} :catch_17
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_16} :catch_19
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_16} :catch_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_1d

    return-object v0

    :catch_17
    move-exception v0

    throw v0

    :catch_19
    move-exception v0

    throw v0

    :catch_1b
    move-exception v0

    throw v0

    :catch_1d
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getAsBoolean()Z
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getAsBoolean_4:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, 0x4601130785a674eL

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_14
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_14} :catch_16
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_14} :catch_18
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_14} :catch_1a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_1c

    move-result v0

    return v0

    :catch_16
    move-exception v0

    throw v0

    :catch_18
    move-exception v0

    throw v0

    :catch_1a
    move-exception v0

    throw v0

    :catch_1c
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getAsDate()Ljava/util/Date;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getAsDate_5:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, -0x5dd8e53acbe178f9L

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_11} :catch_12
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_11} :catch_14
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_11} :catch_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_18

    return-object v0

    :catch_12
    move-exception v0

    throw v0

    :catch_14
    move-exception v0

    throw v0

    :catch_16
    move-exception v0

    throw v0

    :catch_18
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getAsNumber()Ljava/lang/Number;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getAsNumber_6:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, -0x55e03ab28e84886dL    # -8.657818866590698E-106

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_11} :catch_12
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_11} :catch_14
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_11} :catch_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_18

    return-object v0

    :catch_12
    move-exception v0

    throw v0

    :catch_14
    move-exception v0

    throw v0

    :catch_16
    move-exception v0

    throw v0

    :catch_18
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getAsString()Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getAsString_7:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, -0x4fcb36844778a403L    # -1.795204164355479E-76

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_11} :catch_12
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_11} :catch_14
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_11} :catch_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_18

    return-object v0

    :catch_12
    move-exception v0

    throw v0

    :catch_14
    move-exception v0

    throw v0

    :catch_16
    move-exception v0

    throw v0

    :catch_18
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getCollection()[Lfreemarker/debug/DebugModel;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getCollection_8:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, -0x1ba5cd2705a7db92L    # -2.5918864095232587E175

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lfreemarker/debug/DebugModel;
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_11} :catch_12
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_11} :catch_14
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_11} :catch_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_18

    return-object v0

    :catch_12
    move-exception v0

    throw v0

    :catch_14
    move-exception v0

    throw v0

    :catch_16
    move-exception v0

    throw v0

    :catch_18
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getDateType()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getDateType_9:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, -0x2d016267c4a490bcL    # -6.236508703759942E91

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_14
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_14} :catch_16
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_14} :catch_18
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_14} :catch_1a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_1c

    move-result v0

    return v0

    :catch_16
    move-exception v0

    throw v0

    :catch_18
    move-exception v0

    throw v0

    :catch_1a
    move-exception v0

    throw v0

    :catch_1c
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getId()J
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getId_10:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, -0x53d520bc85967ce8L

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J
    :try_end_14
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_14} :catch_16
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_14} :catch_18
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_1a

    move-result-wide v0

    return-wide v0

    :catch_16
    move-exception v0

    throw v0

    :catch_18
    move-exception v0

    throw v0

    :catch_1a
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getModelTypes()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_getModelTypes_11:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, -0x32f9b9fad6e9c639L    # -1.1453491401649141E63

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_14
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_14} :catch_16
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_14} :catch_18
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_1a

    move-result v0

    return v0

    :catch_16
    move-exception v0

    throw v0

    :catch_18
    move-exception v0

    throw v0

    :catch_1a
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public keys()[Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_keys_12:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, 0x7d0cc2f35c1edc7L

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_11} :catch_12
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_11} :catch_14
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_11} :catch_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_18

    return-object v0

    :catch_12
    move-exception v0

    throw v0

    :catch_14
    move-exception v0

    throw v0

    :catch_16
    move-exception v0

    throw v0

    :catch_18
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public resume()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_resume_13:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, 0x394608833de3d0c2L    # 8.48690018717856E-33

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;
    :try_end_e
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_e} :catch_f
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_e} :catch_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_13

    return-void

    :catch_f
    move-exception v0

    throw v0

    :catch_11
    move-exception v0

    throw v0

    :catch_13
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public size()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_size_14:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, 0x3e624d5ddf585627L    # 3.409052943770969E-8

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_14
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_14} :catch_16
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_14} :catch_18
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_14} :catch_1a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_1c

    move-result v0

    return v0

    :catch_16
    move-exception v0

    throw v0

    :catch_18
    move-exception v0

    throw v0

    :catch_1a
    move-exception v0

    throw v0

    :catch_1c
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public stop()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl_Stub;->$method_stop_15:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, -0x27a2f88f705bfd9aL    # -4.575213012246065E117

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;
    :try_end_e
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_e} :catch_f
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_e} :catch_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_13

    return-void

    :catch_f
    move-exception v0

    throw v0

    :catch_11
    move-exception v0

    throw v0

    :catch_13
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method
