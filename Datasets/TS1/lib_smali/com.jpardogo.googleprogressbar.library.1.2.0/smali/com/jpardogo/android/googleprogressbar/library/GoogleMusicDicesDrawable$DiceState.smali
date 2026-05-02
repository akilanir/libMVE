.class Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;
.super Ljava/lang/Object;
.source "GoogleMusicDicesDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DiceState"
.end annotation


# instance fields
.field private side1:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

.field private side2:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

.field final synthetic this$0:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;


# direct methods
.method constructor <init>(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;)V
    .registers 4
    .param p2, "side1"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;
    .param p3, "side2"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->this$0:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->side1:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    .line 58
    iput-object p3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->side2:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    .line 59
    return-void
.end method

.method static synthetic access$400(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;)Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;
    .registers 2
    .param p0, "x0"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->side1:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    return-object v0
.end method

.method static synthetic access$500(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;)Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;
    .registers 2
    .param p0, "x0"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->side2:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    return-object v0
.end method
