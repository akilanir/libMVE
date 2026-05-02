.class Lrx/android/operators/OperatorTextViewInput$SimpleTextWatcher;
.super Ljava/lang/Object;
.source "OperatorTextViewInput.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/android/operators/OperatorTextViewInput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SimpleTextWatcher"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lrx/android/operators/OperatorTextViewInput$1;)V
    .registers 2
    .param p1, "x0"    # Lrx/android/operators/OperatorTextViewInput$1;

    .prologue
    .line 61
    invoke-direct {p0}, Lrx/android/operators/OperatorTextViewInput$SimpleTextWatcher;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2
    .param p1, "editable"    # Landroid/text/Editable;

    .prologue
    .line 75
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "sequence"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 65
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "sequence"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 70
    return-void
.end method
