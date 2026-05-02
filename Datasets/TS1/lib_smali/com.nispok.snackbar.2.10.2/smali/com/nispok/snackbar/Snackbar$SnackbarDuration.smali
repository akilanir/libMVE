.class public final enum Lcom/nispok/snackbar/Snackbar$SnackbarDuration;
.super Ljava/lang/Enum;
.source "Snackbar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nispok/snackbar/Snackbar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SnackbarDuration"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/nispok/snackbar/Snackbar$SnackbarDuration;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

.field public static final enum LENGTH_INDEFINITE:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

.field public static final enum LENGTH_LONG:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

.field public static final enum LENGTH_SHORT:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;


# instance fields
.field private duration:J


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 46
    new-instance v0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    const-string v1, "LENGTH_SHORT"

    const-wide/16 v2, 0x7d0

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->LENGTH_SHORT:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    new-instance v0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    const-string v1, "LENGTH_LONG"

    const-wide/16 v2, 0xdac

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->LENGTH_LONG:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    new-instance v0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    const-string v1, "LENGTH_INDEFINITE"

    const-wide/16 v2, -0x1

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->LENGTH_INDEFINITE:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    .line 45
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    sget-object v1, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->LENGTH_SHORT:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    aput-object v1, v0, v4

    sget-object v1, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->LENGTH_LONG:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    aput-object v1, v0, v5

    sget-object v1, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->LENGTH_INDEFINITE:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    aput-object v1, v0, v6

    sput-object v0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->$VALUES:[Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IJ)V
    .registers 5
    .param p3, "duration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)V"
        }
    .end annotation

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 51
    iput-wide p3, p0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->duration:J

    .line 52
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/nispok/snackbar/Snackbar$SnackbarDuration;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 45
    const-class v0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    return-object v0
.end method

.method public static values()[Lcom/nispok/snackbar/Snackbar$SnackbarDuration;
    .registers 1

    .prologue
    .line 45
    sget-object v0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->$VALUES:[Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    invoke-virtual {v0}, [Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    return-object v0
.end method


# virtual methods
.method public getDuration()J
    .registers 3

    .prologue
    .line 55
    iget-wide v0, p0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->duration:J

    return-wide v0
.end method
