.class public final enum Lcom/github/mrengineer13/snackbar/SnackBar$Style;
.super Ljava/lang/Enum;
.source "SnackBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/mrengineer13/snackbar/SnackBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Style"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/github/mrengineer13/snackbar/SnackBar$Style;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/mrengineer13/snackbar/SnackBar$Style;

.field public static final enum ALERT:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

.field public static final enum CONFIRM:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

.field public static final enum DEFAULT:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

.field public static final enum INFO:Lcom/github/mrengineer13/snackbar/SnackBar$Style;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 434
    new-instance v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    const-string v1, "DEFAULT"

    invoke-direct {v0, v1, v2}, Lcom/github/mrengineer13/snackbar/SnackBar$Style;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->DEFAULT:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    .line 435
    new-instance v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    const-string v1, "ALERT"

    invoke-direct {v0, v1, v3}, Lcom/github/mrengineer13/snackbar/SnackBar$Style;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->ALERT:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    .line 436
    new-instance v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    const-string v1, "CONFIRM"

    invoke-direct {v0, v1, v4}, Lcom/github/mrengineer13/snackbar/SnackBar$Style;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->CONFIRM:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    .line 437
    new-instance v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    const-string v1, "INFO"

    invoke-direct {v0, v1, v5}, Lcom/github/mrengineer13/snackbar/SnackBar$Style;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->INFO:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    .line 433
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    sget-object v1, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->DEFAULT:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    aput-object v1, v0, v2

    sget-object v1, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->ALERT:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    aput-object v1, v0, v3

    sget-object v1, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->CONFIRM:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    aput-object v1, v0, v4

    sget-object v1, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->INFO:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    aput-object v1, v0, v5

    sput-object v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->$VALUES:[Lcom/github/mrengineer13/snackbar/SnackBar$Style;

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
    .line 433
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/mrengineer13/snackbar/SnackBar$Style;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 433
    const-class v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    return-object v0
.end method

.method public static values()[Lcom/github/mrengineer13/snackbar/SnackBar$Style;
    .registers 1

    .prologue
    .line 433
    sget-object v0, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->$VALUES:[Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    invoke-virtual {v0}, [Lcom/github/mrengineer13/snackbar/SnackBar$Style;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    return-object v0
.end method
