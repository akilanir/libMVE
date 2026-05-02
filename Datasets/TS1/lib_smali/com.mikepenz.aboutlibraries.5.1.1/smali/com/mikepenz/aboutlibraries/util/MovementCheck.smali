.class public Lcom/mikepenz/aboutlibraries/util/MovementCheck;
.super Landroid/text/method/LinkMovementMethod;
.source "MovementCheck.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/text/method/LinkMovementMethod;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "widget"    # Landroid/widget/TextView;
    .param p2, "buffer"    # Landroid/text/Spannable;
    .param p3, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 13
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Landroid/text/method/LinkMovementMethod;->onTouchEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result v1

    .line 15
    :goto_4
    return v1

    .line 14
    :catch_5
    move-exception v0

    .line 15
    .local v0, "ex":Ljava/lang/Exception;
    const/4 v1, 0x1

    goto :goto_4
.end method
