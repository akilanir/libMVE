.class Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;
.super Ljava/lang/Object;
.source "ProxyFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/util/proxy/ProxyFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Find2MethodsArgs"
.end annotation


# instance fields
.field delegatorName:Ljava/lang/String;

.field descriptor:Ljava/lang/String;

.field methodName:Ljava/lang/String;

.field origIndex:I


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 5
    .param p1, "mname"    # Ljava/lang/String;
    .param p2, "dname"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;
    .param p4, "index"    # I

    .prologue
    .line 1299
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1300
    iput-object p1, p0, Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;->methodName:Ljava/lang/String;

    .line 1301
    iput-object p2, p0, Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;->delegatorName:Ljava/lang/String;

    .line 1302
    iput-object p3, p0, Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;->descriptor:Ljava/lang/String;

    .line 1303
    iput p4, p0, Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;->origIndex:I

    .line 1304
    return-void
.end method
