.class final Lfreemarker/template/utility/SecurityUtilities$3;
.super Ljava/lang/Object;
.source "SecurityUtilities.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# instance fields
.field private final val$defValue:I

.field private final val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/template/utility/SecurityUtilities$3;->val$key:Ljava/lang/String;

    iput p2, p0, Lfreemarker/template/utility/SecurityUtilities$3;->val$defValue:I

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 114
    iget-object v0, p0, Lfreemarker/template/utility/SecurityUtilities$3;->val$key:Ljava/lang/String;

    iget v1, p0, Lfreemarker/template/utility/SecurityUtilities$3;->val$defValue:I

    invoke-static {v0, v1}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
