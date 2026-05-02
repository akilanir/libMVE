.class public final enum Lcom/mikepenz/aboutlibraries/LibTaskExecutor;
.super Ljava/lang/Enum;
.source "LibTaskExecutor.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mikepenz/aboutlibraries/LibTaskExecutor;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

.field public static final enum DEFAULT_EXECUTOR:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

.field public static final enum SERIAL_EXECUTOR:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

.field public static final enum THREAD_POOL_EXECUTOR:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 11
    new-instance v0, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    const-string v1, "DEFAULT_EXECUTOR"

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;->DEFAULT_EXECUTOR:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    .line 12
    new-instance v0, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    const-string v1, "THREAD_POOL_EXECUTOR"

    invoke-direct {v0, v1, v3}, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;->THREAD_POOL_EXECUTOR:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    .line 13
    new-instance v0, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    const-string v1, "SERIAL_EXECUTOR"

    invoke-direct {v0, v1, v4}, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;->SERIAL_EXECUTOR:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    .line 10
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    sget-object v1, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;->DEFAULT_EXECUTOR:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;->THREAD_POOL_EXECUTOR:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;->SERIAL_EXECUTOR:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    aput-object v1, v0, v4

    sput-object v0, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;->$VALUES:[Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibTaskExecutor;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 10
    const-class v0, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    return-object v0
.end method

.method public static values()[Lcom/mikepenz/aboutlibraries/LibTaskExecutor;
    .registers 1

    .prologue
    .line 10
    sget-object v0, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;->$VALUES:[Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    invoke-virtual {v0}, [Lcom/mikepenz/aboutlibraries/LibTaskExecutor;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    return-object v0
.end method
