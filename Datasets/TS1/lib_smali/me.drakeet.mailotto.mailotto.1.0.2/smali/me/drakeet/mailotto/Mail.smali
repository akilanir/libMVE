.class public Lme/drakeet/mailotto/Mail;
.super Ljava/lang/Object;
.source "Mail.java"


# instance fields
.field public content:Ljava/lang/Object;

.field public from:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public to:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Class;)V
    .registers 4
    .param p1, "content"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p2, "to":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lme/drakeet/mailotto/Mail;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 4
    .param p1, "content"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p2, "to":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "from":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p2, p0, Lme/drakeet/mailotto/Mail;->to:Ljava/lang/Class;

    .line 37
    iput-object p3, p0, Lme/drakeet/mailotto/Mail;->from:Ljava/lang/Class;

    .line 38
    iput-object p1, p0, Lme/drakeet/mailotto/Mail;->content:Ljava/lang/Object;

    .line 39
    return-void
.end method
