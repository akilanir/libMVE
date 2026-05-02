.class public final Lcom/stericson/RootTools/R$drawable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootTools/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "drawable"
.end annotation


# static fields
.field public static ic_launcher:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 14
    const/high16 v0, 0x7f020000

    sput v0, Lcom/stericson/RootTools/R$drawable;->ic_launcher:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
