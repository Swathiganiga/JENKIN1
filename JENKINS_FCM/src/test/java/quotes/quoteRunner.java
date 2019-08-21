package quotes;
import com.intuit.karate.junit4.Karate;

import cucumber.api.CucumberOptions;

import org.junit.runner.RunWith;

@RunWith(Karate.class)
@CucumberOptions(features="quote.feature",
plugin= {"json:target/cucumber.json"}
		)
public class quoteRunner {

}
