.class public final enum Lcom/stericson/RootTools/execution/Shell$ShellType;
.super Ljava/lang/Enum;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootTools/execution/Shell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ShellType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/stericson/RootTools/execution/Shell$ShellType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/stericson/RootTools/execution/Shell$ShellType;

.field public static final enum CUSTOM:Lcom/stericson/RootTools/execution/Shell$ShellType;

.field public static final enum NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellType;

.field public static final enum ROOT:Lcom/stericson/RootTools/execution/Shell$ShellType;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 40
    new-instance v0, Lcom/stericson/RootTools/execution/Shell$ShellType;

    const-string v1, "NORMAL"

    invoke-direct {v0, v1, v2}, Lcom/stericson/RootTools/execution/Shell$ShellType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellType;->NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellType;

    .line 41
    new-instance v0, Lcom/stericson/RootTools/execution/Shell$ShellType;

    const-string v1, "ROOT"

    invoke-direct {v0, v1, v3}, Lcom/stericson/RootTools/execution/Shell$ShellType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellType;->ROOT:Lcom/stericson/RootTools/execution/Shell$ShellType;

    .line 42
    new-instance v0, Lcom/stericson/RootTools/execution/Shell$ShellType;

    const-string v1, "CUSTOM"

    invoke-direct {v0, v1, v4}, Lcom/stericson/RootTools/execution/Shell$ShellType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellType;->CUSTOM:Lcom/stericson/RootTools/execution/Shell$ShellType;

    .line 39
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/stericson/RootTools/execution/Shell$ShellType;

    sget-object v1, Lcom/stericson/RootTools/execution/Shell$ShellType;->NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/stericson/RootTools/execution/Shell$ShellType;->ROOT:Lcom/stericson/RootTools/execution/Shell$ShellType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/stericson/RootTools/execution/Shell$ShellType;->CUSTOM:Lcom/stericson/RootTools/execution/Shell$ShellType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/stericson/RootTools/execution/Shell$ShellType;->$VALUES:[Lcom/stericson/RootTools/execution/Shell$ShellType;

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
    .line 39
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/stericson/RootTools/execution/Shell$ShellType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 39
    const-class v0, Lcom/stericson/RootTools/execution/Shell$ShellType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/stericson/RootTools/execution/Shell$ShellType;

    return-object v0
.end method

.method public static values()[Lcom/stericson/RootTools/execution/Shell$ShellType;
    .registers 1

    .prologue
    .line 39
    sget-object v0, Lcom/stericson/RootTools/execution/Shell$ShellType;->$VALUES:[Lcom/stericson/RootTools/execution/Shell$ShellType;

    invoke-virtual {v0}, [Lcom/stericson/RootTools/execution/Shell$ShellType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/stericson/RootTools/execution/Shell$ShellType;

    return-object v0
.end method
