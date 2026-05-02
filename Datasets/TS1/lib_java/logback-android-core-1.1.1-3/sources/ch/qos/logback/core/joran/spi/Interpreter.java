package ch.qos.logback.core.joran.spi;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.joran.action.Action;
import ch.qos.logback.core.joran.action.ImplicitAction;
import ch.qos.logback.core.joran.event.BodyEvent;
import ch.qos.logback.core.joran.event.EndEvent;
import ch.qos.logback.core.joran.event.StartEvent;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Stack;
import java.util.Vector;
import org.xml.sax.Attributes;
import org.xml.sax.Locator;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/spi/Interpreter.class */
public class Interpreter {
    private static List<Action> EMPTY_LIST = new Vector(0);
    private final RuleStore ruleStore;
    private final InterpretationContext interpretationContext;
    private final CAI_WithLocatorSupport cai;
    private ElementPath elementPath;
    Locator locator;
    ElementPath skip = null;
    private final ArrayList<ImplicitAction> implicitActions = new ArrayList<>(3);
    Stack<List<Action>> actionListStack = new Stack<>();
    EventPlayer eventPlayer = new EventPlayer(this);

    public Interpreter(Context context, RuleStore ruleStore, ElementPath elementPath) {
        this.cai = new CAI_WithLocatorSupport(context, this);
        this.ruleStore = ruleStore;
        this.interpretationContext = new InterpretationContext(context, this);
        this.elementPath = elementPath;
    }

    public EventPlayer getEventPlayer() {
        return this.eventPlayer;
    }

    public void setInterpretationContextPropertiesMap(Map<String, String> map) {
        this.interpretationContext.setPropertiesMap(map);
    }

    public InterpretationContext getExecutionContext() {
        return getInterpretationContext();
    }

    public InterpretationContext getInterpretationContext() {
        return this.interpretationContext;
    }

    public void startDocument() {
    }

    public void startElement(StartEvent startEvent) {
        setDocumentLocator(startEvent.getLocator());
        startElement(startEvent.namespaceURI, startEvent.localName, startEvent.qName, startEvent.attributes);
    }

    private void startElement(String str, String str2, String str3, Attributes attributes) {
        String tagName = getTagName(str2, str3);
        this.elementPath.push(tagName);
        if (this.skip != null) {
            pushEmptyActionList();
            return;
        }
        List<Action> applicableActionList = getApplicableActionList(this.elementPath, attributes);
        if (applicableActionList != null) {
            this.actionListStack.add(applicableActionList);
            callBeginAction(applicableActionList, tagName, attributes);
        } else {
            pushEmptyActionList();
            this.cai.addError("no applicable action for [" + tagName + "], current ElementPath  is [" + this.elementPath + "]");
        }
    }

    private void pushEmptyActionList() {
        this.actionListStack.add(EMPTY_LIST);
    }

    public void characters(BodyEvent bodyEvent) {
        setDocumentLocator(bodyEvent.locator);
        String text = bodyEvent.getText();
        List<Action> peek = this.actionListStack.peek();
        if (text != null) {
            String trim = text.trim();
            if (trim.length() > 0) {
                callBodyAction(peek, trim);
            }
        }
    }

    public void endElement(EndEvent endEvent) {
        setDocumentLocator(endEvent.locator);
        endElement(endEvent.namespaceURI, endEvent.localName, endEvent.qName);
    }

    private void endElement(String str, String str2, String str3) {
        List<Action> pop = this.actionListStack.pop();
        if (this.skip != null) {
            if (this.skip.equals(this.elementPath)) {
                this.skip = null;
            }
        } else if (pop != EMPTY_LIST) {
            callEndAction(pop, getTagName(str2, str3));
        }
        this.elementPath.pop();
    }

    public Locator getLocator() {
        return this.locator;
    }

    public void setDocumentLocator(Locator locator) {
        this.locator = locator;
    }

    String getTagName(String str, String str2) {
        String str3 = str;
        if (str3 == null || str3.length() < 1) {
            str3 = str2;
        }
        return str3;
    }

    public void addImplicitAction(ImplicitAction implicitAction) {
        this.implicitActions.add(implicitAction);
    }

    List<Action> lookupImplicitAction(ElementPath elementPath, Attributes attributes, InterpretationContext interpretationContext) {
        int size = this.implicitActions.size();
        for (int i = 0; i < size; i++) {
            ImplicitAction implicitAction = this.implicitActions.get(i);
            if (implicitAction.isApplicable(elementPath, attributes, interpretationContext)) {
                ArrayList arrayList = new ArrayList(1);
                arrayList.add(implicitAction);
                return arrayList;
            }
        }
        return null;
    }

    List<Action> getApplicableActionList(ElementPath elementPath, Attributes attributes) {
        List<Action> matchActions = this.ruleStore.matchActions(elementPath);
        if (matchActions == null) {
            matchActions = lookupImplicitAction(elementPath, attributes, this.interpretationContext);
        }
        return matchActions;
    }

    void callBeginAction(List<Action> list, String str, Attributes attributes) {
        if (list == null) {
            return;
        }
        Iterator<Action> it = list.iterator();
        while (it.hasNext()) {
            try {
                it.next().begin(this.interpretationContext, str, attributes);
            } catch (ActionException e) {
                this.skip = this.elementPath.duplicate();
                this.cai.addError("ActionException in Action for tag [" + str + "]", e);
            } catch (RuntimeException e2) {
                this.skip = this.elementPath.duplicate();
                this.cai.addError("RuntimeException in Action for tag [" + str + "]", e2);
            }
        }
    }

    private void callBodyAction(List<Action> list, String str) {
        if (list == null) {
            return;
        }
        for (Action action : list) {
            try {
                action.body(this.interpretationContext, str);
            } catch (ActionException e) {
                this.cai.addError("Exception in end() methd for action [" + action + "]", e);
            }
        }
    }

    private void callEndAction(List<Action> list, String str) {
        if (list == null) {
            return;
        }
        Iterator<Action> it = list.iterator();
        while (it.hasNext()) {
            try {
                it.next().end(this.interpretationContext, str);
            } catch (ActionException e) {
                this.cai.addError("ActionException in Action for tag [" + str + "]", e);
            } catch (RuntimeException e2) {
                this.cai.addError("RuntimeException in Action for tag [" + str + "]", e2);
            }
        }
    }

    public RuleStore getRuleStore() {
        return this.ruleStore;
    }
}
