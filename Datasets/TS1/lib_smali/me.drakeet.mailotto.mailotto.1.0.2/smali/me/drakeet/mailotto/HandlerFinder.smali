.class interface abstract Lme/drakeet/mailotto/HandlerFinder;
.super Ljava/lang/Object;
.source "HandlerFinder.java"


# static fields
.field public static final ANNOTATED:Lme/drakeet/mailotto/HandlerFinder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    new-instance v0, Lme/drakeet/mailotto/HandlerFinder$1;

    invoke-direct {v0}, Lme/drakeet/mailotto/HandlerFinder$1;-><init>()V

    sput-object v0, Lme/drakeet/mailotto/HandlerFinder;->ANNOTATED:Lme/drakeet/mailotto/HandlerFinder;

    return-void
.end method


# virtual methods
.method public abstract findOnMailReceived(Ljava/lang/Object;)Lme/drakeet/mailotto/MailHandler;
.end method
