.class Lfreemarker/ext/jsp/_FreeMarkerPageContext21$2;
.super Ljava/lang/Object;
.source "_FreeMarkerPageContext21.java"

# interfaces
.implements Ljavax/servlet/jsp/el/VariableResolver;


# instance fields
.field private final this$0:Lfreemarker/ext/jsp/_FreeMarkerPageContext21;

.field private final val$ctx:Ljavax/servlet/jsp/PageContext;


# direct methods
.method constructor <init>(Lfreemarker/ext/jsp/_FreeMarkerPageContext21;Ljavax/servlet/jsp/PageContext;)V
    .registers 3

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jsp/_FreeMarkerPageContext21$2;->this$0:Lfreemarker/ext/jsp/_FreeMarkerPageContext21;

    iput-object p2, p0, Lfreemarker/ext/jsp/_FreeMarkerPageContext21$2;->val$ctx:Ljavax/servlet/jsp/PageContext;

    return-void
.end method


# virtual methods
.method public resolveVariable(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/el/ELException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lfreemarker/ext/jsp/_FreeMarkerPageContext21$2;->val$ctx:Ljavax/servlet/jsp/PageContext;

    invoke-virtual {v0, p1}, Ljavax/servlet/jsp/PageContext;->findAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
