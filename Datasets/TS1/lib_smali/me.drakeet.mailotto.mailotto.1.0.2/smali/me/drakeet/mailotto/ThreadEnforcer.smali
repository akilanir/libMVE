.class public interface abstract Lme/drakeet/mailotto/ThreadEnforcer;
.super Ljava/lang/Object;
.source "ThreadEnforcer.java"


# static fields
.field public static final ANY:Lme/drakeet/mailotto/ThreadEnforcer;

.field public static final MAIN:Lme/drakeet/mailotto/ThreadEnforcer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 41
    new-instance v0, Lme/drakeet/mailotto/ThreadEnforcer$1;

    invoke-direct {v0}, Lme/drakeet/mailotto/ThreadEnforcer$1;-><init>()V

    sput-object v0, Lme/drakeet/mailotto/ThreadEnforcer;->ANY:Lme/drakeet/mailotto/ThreadEnforcer;

    .line 50
    new-instance v0, Lme/drakeet/mailotto/ThreadEnforcer$2;

    invoke-direct {v0}, Lme/drakeet/mailotto/ThreadEnforcer$2;-><init>()V

    sput-object v0, Lme/drakeet/mailotto/ThreadEnforcer;->MAIN:Lme/drakeet/mailotto/ThreadEnforcer;

    return-void
.end method


# virtual methods
.method public abstract enforce(Lme/drakeet/mailotto/Mailbox;)V
.end method
