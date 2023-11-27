import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test(timeout = 500)
  public void testFilter() {
    List<String> listInput1 = Arrays.asList("b", "moon", "a");
    List<String> listInput2 = Arrays.asList("b", "moon", "MOON");
    List<String> expected1 = Arrays.asList("moon");
    List<String> expected2 = Arrays.asList("moon", "MOON");

    List<String> list1 = ListExamples.filter(listInput1, new IsMoon());
    List<String> list2 = ListExamples.filter(listInput2, new IsMoon());
    assertEquals(list1, expected1);
    assertEquals(list2, expected2);
  }
  
  @Test(timeout = 500)
  public void fail() {
    assertEquals("list2", "");
  }
}


