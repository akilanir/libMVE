.class final Lfreemarker/ext/rhino/RhinoWrapper$1;
.super Ljava/lang/Object;
.source "RhinoWrapper.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    sget-object v0, Lfreemarker/ext/rhino/RhinoWrapper;->class$org$mozilla$javascript$Undefined:Ljava/lang/Class;

    if-nez v0, :cond_18

    const-string v0, "org.mozilla.javascript.Undefined"

    invoke-static {v0}, Lfreemarker/ext/rhino/RhinoWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/rhino/RhinoWrapper;->class$org$mozilla$javascript$Undefined:Ljava/lang/Class;

    :goto_c
    const-string v1, "instance"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_18
    sget-object v0, Lfreemarker/ext/rhino/RhinoWrapper;->class$org$mozilla$javascript$Undefined:Ljava/lang/Class;

    goto :goto_c
.end method
