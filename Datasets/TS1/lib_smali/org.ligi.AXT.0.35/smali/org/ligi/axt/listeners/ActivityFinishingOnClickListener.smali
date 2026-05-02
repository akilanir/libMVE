.class public Lorg/ligi/axt/listeners/ActivityFinishingOnClickListener;
.super Ljava/lang/Object;
.source "ActivityFinishingOnClickListener.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final activity2finish:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity2finish"    # Landroid/app/Activity;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lorg/ligi/axt/listeners/ActivityFinishingOnClickListener;->activity2finish:Landroid/app/Activity;

    .line 13
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 17
    iget-object v0, p0, Lorg/ligi/axt/listeners/ActivityFinishingOnClickListener;->activity2finish:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 18
    return-void
.end method
