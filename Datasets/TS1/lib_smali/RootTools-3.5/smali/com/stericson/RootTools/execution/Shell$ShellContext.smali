.class public final enum Lcom/stericson/RootTools/execution/Shell$ShellContext;
.super Ljava/lang/Enum;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootTools/execution/Shell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ShellContext"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/stericson/RootTools/execution/Shell$ShellContext;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/stericson/RootTools/execution/Shell$ShellContext;

.field public static final enum NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellContext;

.field public static final enum PLATFORM_APP:Lcom/stericson/RootTools/execution/Shell$ShellContext;

.field public static final enum RECOVERY:Lcom/stericson/RootTools/execution/Shell$ShellContext;

.field public static final enum SHELL:Lcom/stericson/RootTools/execution/Shell$ShellContext;

.field public static final enum SYSTEM_APP:Lcom/stericson/RootTools/execution/Shell$ShellContext;

.field public static final enum SYSTEM_SERVER:Lcom/stericson/RootTools/execution/Shell$ShellContext;

.field public static final enum UNTRUSTED_APP:Lcom/stericson/RootTools/execution/Shell$ShellContext;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 47
    new-instance v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;

    const-string v1, "NORMAL"

    const-string v2, "normal"

    invoke-direct {v0, v1, v4, v2}, Lcom/stericson/RootTools/execution/Shell$ShellContext;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    .line 48
    new-instance v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;

    const-string v1, "SHELL"

    const-string v2, "u:r:shell:s0"

    invoke-direct {v0, v1, v5, v2}, Lcom/stericson/RootTools/execution/Shell$ShellContext;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->SHELL:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    .line 49
    new-instance v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;

    const-string v1, "SYSTEM_SERVER"

    const-string v2, "u:r:system_server:s0"

    invoke-direct {v0, v1, v6, v2}, Lcom/stericson/RootTools/execution/Shell$ShellContext;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->SYSTEM_SERVER:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    .line 50
    new-instance v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;

    const-string v1, "SYSTEM_APP"

    const-string v2, "u:r:system_app:s0"

    invoke-direct {v0, v1, v7, v2}, Lcom/stericson/RootTools/execution/Shell$ShellContext;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->SYSTEM_APP:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    .line 51
    new-instance v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;

    const-string v1, "PLATFORM_APP"

    const-string v2, "u:r:platform_app:s0"

    invoke-direct {v0, v1, v8, v2}, Lcom/stericson/RootTools/execution/Shell$ShellContext;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->PLATFORM_APP:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    .line 52
    new-instance v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;

    const-string v1, "UNTRUSTED_APP"

    const/4 v2, 0x5

    const-string v3, "u:r:untrusted_app:s0"

    invoke-direct {v0, v1, v2, v3}, Lcom/stericson/RootTools/execution/Shell$ShellContext;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->UNTRUSTED_APP:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    .line 53
    new-instance v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;

    const-string v1, "RECOVERY"

    const/4 v2, 0x6

    const-string v3, "u:r:recovery:s0"

    invoke-direct {v0, v1, v2, v3}, Lcom/stericson/RootTools/execution/Shell$ShellContext;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->RECOVERY:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    .line 46
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/stericson/RootTools/execution/Shell$ShellContext;

    sget-object v1, Lcom/stericson/RootTools/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    aput-object v1, v0, v4

    sget-object v1, Lcom/stericson/RootTools/execution/Shell$ShellContext;->SHELL:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    aput-object v1, v0, v5

    sget-object v1, Lcom/stericson/RootTools/execution/Shell$ShellContext;->SYSTEM_SERVER:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    aput-object v1, v0, v6

    sget-object v1, Lcom/stericson/RootTools/execution/Shell$ShellContext;->SYSTEM_APP:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    aput-object v1, v0, v7

    sget-object v1, Lcom/stericson/RootTools/execution/Shell$ShellContext;->PLATFORM_APP:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/stericson/RootTools/execution/Shell$ShellContext;->UNTRUSTED_APP:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/stericson/RootTools/execution/Shell$ShellContext;->RECOVERY:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    aput-object v2, v0, v1

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->$VALUES:[Lcom/stericson/RootTools/execution/Shell$ShellContext;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 59
    iput-object p3, p0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->value:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/stericson/RootTools/execution/Shell$ShellContext;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    const-class v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;

    return-object v0
.end method

.method public static values()[Lcom/stericson/RootTools/execution/Shell$ShellContext;
    .registers 1

    .prologue
    .line 46
    sget-object v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->$VALUES:[Lcom/stericson/RootTools/execution/Shell$ShellContext;

    invoke-virtual {v0}, [Lcom/stericson/RootTools/execution/Shell$ShellContext;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/stericson/RootTools/execution/Shell$ShellContext;

    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->value:Ljava/lang/String;

    return-object v0
.end method
