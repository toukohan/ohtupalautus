import unittest
from statistics_service import StatisticsService
from player import Player

class PlayerReaderStub:
    def get_players(self):
        return [
            Player("Semenko", "EDM", 4, 12),
            Player("Lemieux", "PIT", 45, 54),
            Player("Kurri",   "EDM", 37, 53),
            Player("Yzerman", "DET", 42, 56),
            Player("Gretzky", "EDM", 35, 89)
        ]

class TestStatisticsService(unittest.TestCase):

    def setUp(self):
        self.stats = StatisticsService(PlayerReaderStub())

    def test_search(self):
        self.assertEqual(self.stats.search("Kurri").name, "Kurri") 

    def test_search_for_none(self):
        self.assertEqual(self.stats.search("mörkö"), None)

    def test_top_points(self):
        self.assertEqual(self.stats.top(1)[0].name, "Gretzky") 

    def test_find_team(self):
        players = self.stats.team("EDM")
        self.assertEqual(len(players), 3)
