.class Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext$1;
.super Ljavax/el/VariableMapper;
.source "FreeMarkerJspApplicationContext.java"


# instance fields
.field private final this$1:Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;


# direct methods
.method constructor <init>(Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;)V
    .registers 2

    .prologue
    .line 123
    invoke-direct {p0}, Ljavax/el/VariableMapper;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext$1;->this$1:Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;

    return-void
.end method


# virtual methods
.method public resolveVariable(Ljava/lang/String;)Ljavax/el/ValueExpression;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 125
    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext$1;->this$1:Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;

    invoke-static {v1}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;->access$100(Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;)Lfreemarker/ext/jsp/FreeMarkerPageContext;

    move-result-object v1

    invoke-virtual {v1, p1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->findAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 126
    .local v0, "obj":Ljava/lang/Object;
    if-nez v0, :cond_e

    .line 127
    const/4 v1, 0x0

    .line 129
    :goto_d
    return-object v1

    :cond_e
    invoke-static {}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->access$200()Ljavax/el/ExpressionFactory;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljavax/el/ExpressionFactory;->createValueExpression(Ljava/lang/Object;Ljava/lang/Class;)Ljavax/el/ValueExpression;

    move-result-object v1

    goto :goto_d
.end method

.method public setVariable(Ljava/lang/String;Ljavax/el/ValueExpression;)Ljavax/el/ValueExpression;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljavax/el/ValueExpression;

    .prologue
    .line 135
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext$1;->resolveVariable(Ljava/lang/String;)Ljavax/el/ValueExpression;

    move-result-object v0

    .line 136
    .local v0, "prev":Ljavax/el/ValueExpression;
    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext$1;->this$1:Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;

    invoke-static {v1}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;->access$100(Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;)Lfreemarker/ext/jsp/FreeMarkerPageContext;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext$1;->this$1:Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;

    invoke-virtual {p2, v2}, Ljavax/el/ValueExpression;->getValue(Ljavax/el/ELContext;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 138
    return-object v0
.end method
