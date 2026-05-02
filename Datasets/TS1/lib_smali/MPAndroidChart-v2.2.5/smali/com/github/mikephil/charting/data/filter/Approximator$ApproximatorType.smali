.class public final enum Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;
.super Ljava/lang/Enum;
.source "Approximator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/mikephil/charting/data/filter/Approximator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ApproximatorType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

.field public static final enum DOUGLAS_PEUCKER:Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

.field public static final enum NONE:Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 34
    new-instance v0, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;->NONE:Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

    new-instance v0, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

    const-string v1, "DOUGLAS_PEUCKER"

    invoke-direct {v0, v1, v3}, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;->DOUGLAS_PEUCKER:Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

    .line 33
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

    sget-object v1, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;->NONE:Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;->DOUGLAS_PEUCKER:Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;->$VALUES:[Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

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
    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 33
    const-class v0, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

    return-object v0
.end method

.method public static values()[Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;
    .registers 1

    .prologue
    .line 33
    sget-object v0, Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;->$VALUES:[Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

    invoke-virtual {v0}, [Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/mikephil/charting/data/filter/Approximator$ApproximatorType;

    return-object v0
.end method
